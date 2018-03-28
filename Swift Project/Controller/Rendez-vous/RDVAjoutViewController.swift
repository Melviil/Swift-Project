//
//  RDVAjoutViewController.swift
//  Swift Project
//
//  Created by Melvil on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import UserNotifications

class RDVAjoutViewController: UIViewController {

    var medecinSent : Medecin?
    var dateChoisiSent = String()
    var heureChoisieSent = String()
    var tempsPourArriverRDVSent = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     self.navigationItem.setHidesBackButton(true, animated:true);
        UNUserNotificationCenter.current().requestAuthorization(options : [.alert, .sound, .badge], completionHandler : {didAllow, error in})
    saveNewRDV(withMedecin : medecinSent!, withdateChoisi: dateChoisiSent, withheureChoisie: heureChoisieSent, withtempsPourArriverRDV: tempsPourArriverRDVSent)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /**
     sauvegarde le nouveau rdv dans la bd à partir de tous les champs remplis précédemment
     @param medecinSent, correspond au meddecin avec qui il y a rdv
     @param heureChoisieSent les heures choisis pour le rdv
     @param tempsPourarriver, les temps qu'il faut pr arriver au rdv
     @param withdateChoisi la date où se déroulerait le rdv
     
     
     */
    
    func saveNewRDV( withMedecin medecinSent : Medecin ,withdateChoisi dateChoisiSent : String, withheureChoisie heureChoisieSent : String,  withtempsPourArriverRDV tempsPourArriverRDVSent: String){
        
        let daoF = CoreDataDAOFactory.getInstance()
        let rdvDAO = daoF.getRendezVousDAO()
        let rendezVous: RendezVous = rdvDAO.create()
        

        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone.current
        
        let heureFormatter = DateFormatter()
        heureFormatter.dateFormat = "HH:mm"
        heureFormatter.timeZone = TimeZone.current
        
        guard let dateChoisi = dateFormatter.date(from:dateChoisiSent) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        guard let heureChoisie = heureFormatter.date(from:heureChoisieSent) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        guard let tempsPourArriverRDV = heureFormatter.date(from:tempsPourArriverRDVSent) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        
        
        rendezVous.dateRdv = dateChoisi
        rendezVous.heureRDV = heureChoisie
        rendezVous.tpsPourArriver = tempsPourArriverRDV
        
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "HH mm"
        

        do{
            try rdvDAO.addMedecinRdv(rendezVous: rendezVous, medecin: medecinSent)
        }catch {print("medecin rdv non ajoute")}
        
        
        do{
            try rdvDAO.save(rendezVous: rendezVous)
        }catch {print("rdv non ajoute")}

        let calendar = NSCalendar.current
        ajouterNotif(heure: calendar.component(.hour, from: heureChoisie), minute : calendar.component(.minute, from : heureChoisie), date: dateChoisi, message : "Vous avez votre rendez vous")
        ajouterNotif(heure: calendar.component(.hour, from: heureChoisie), minute : calendar.component(.minute, from : heureChoisie), date: dateChoisi, message : "Il est temps de partir!'")
          ajouterNotifSymptome( date: dateChoisi, message : "Pensez à indiquer votre état durant cette heure!'")

        
        
        
    }
    
    /**
     permet d'ajouter une notification pour rappeler le rdv
     @param h les heures choisis pour notifier le rdv
     @param m les minutes choisis pour notifier le rdv
     @param date, la date choisis pour notifier le rdv
     @param message, la message à afficher dans la notification

     
     */
     func ajouterNotif(heure h: Int, minute m: Int, date : Date, message : String){
        let content = UNMutableNotificationContent()
        content.title = "Dans une 1h Rdv avec Dr " + (medecinSent?.nomMedecin)!
        content.body = message
        content.badge = 1
        let fmt = DateFormatter()
        fmt.dateFormat = "dd/MM/yyyy"
        var dateComponents = DateComponents()
            let calendar = NSCalendar.current
            let components = calendar.dateComponents([.day, .month, .year], from: date)
            dateComponents.day = components.day!
            dateComponents.month = components.month!
            dateComponents.year = components.year!
            dateComponents.hour = h - 1
            dateComponents.minute = m
            let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request2 = UNNotificationRequest(identifier: String(describing: date) + String (m ) + String (m ) + (medecinSent?.nomMedecin)! , content: content, trigger: notificationTrigger)
            // Schedule the request.
            let center = UNUserNotificationCenter.current()
            center.add(request2) { (error : Error?) in
                if let theError = error {
                    print(theError.localizedDescription)
                }
            }
    }
    
    /**
     permet d'ajouter une notification pour rappeler lajout de symptome durant la semaine
     @param date, la date choisis pour notifier le rdv
     @param message, la message à afficher dans la notification
     
     
     */
    func ajouterNotifSymptome(date : Date, message : String){
        let content = UNMutableNotificationContent()
        content.title = "Etat"
        content.body = message
        content.badge = 1
        let fmt = DateFormatter()
        fmt.dateFormat = "dd/MM/yyyy"
        var dateComponents = DateComponents()
        let calendar = NSCalendar.current
        for day in 1 ... 5 {
            var dayComp = DateComponents()
            dayComp.day = -1*day
            let dateMinus = Calendar.current.date(byAdding: dayComp, to: date)
            let components = calendar.dateComponents([.day, .month, .year], from: dateMinus!)
            dateComponents.day = components.day!
            dateComponents.month = components.month!
            dateComponents.year = components.year!
            for heures in 08 ... 18{
                dateComponents.hour = heures
                dateComponents.minute = 00
                print(dateComponents)
                let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                let request2 = UNNotificationRequest(identifier: "sympt" + String(describing: date) + String(heures) , content: content, trigger: notificationTrigger)
                // Schedule the request.
                let center = UNUserNotificationCenter.current()
                center.add(request2) { (error : Error?) in
                    if let theError = error {
                        print(theError.localizedDescription)
                    }
                }
            }
        }
        
      
    }
}
