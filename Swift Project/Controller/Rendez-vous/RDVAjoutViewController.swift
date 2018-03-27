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
    
    saveNewRDV(withMedecin : medecinSent!, withdateChoisi: dateChoisiSent, withheureChoisie: heureChoisieSent, withtempsPourArriverRDV: tempsPourArriverRDVSent)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
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
        
        
        
     
//        for uneHeure in heures {
//            let heure: Heure = heureDAO.create()
//
//            //On repasse la date en Date
//            guard let heureGood = dateFormatter.date(from:uneHeure) else {
//                fatalError("ERROR: Date conversion failed due to mismatched format.")
//            }
//            heure.libelleHeure = heureGood
//            do{
//                try heureDAO.save(heure: heure)
//            }catch{
//            }
//            do{
//                try medicamentDAO.addHeureMedicament(heure:  heure, medicament: medicament)
//            }catch {
//
//            }
//        }
        
        
        do{
            try rdvDAO.addMedecinRdv(rendezVous: rendezVous, medecin: medecinSent)
        }catch {print("medecin rdv non ajoute")}
        
        
        do{
            try rdvDAO.save(rendezVous: rendezVous)
        }catch {print("rdv non ajoute")}

        let calendar = NSCalendar.current
        ajouterNotif(heure: calendar.component(.hour, from: heureChoisie), minute : calendar.component(.minute, from : heureChoisie), date: dateChoisi, message : "Penez à votre rendez vous")
        ajouterNotif(heure: calendar.component(.hour, from: heureChoisie), minute : calendar.component(.minute, from : heureChoisie), date: dateChoisi, message : "Il est temps de partir pour être à l'")
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }
     func ajouterNotif(heure h: Int, minute m: Int, date : Date, message : String){
        let content = UNMutableNotificationContent()
        content.title = "Rendez vous avec Dr " + (medecinSent?.nomMedecin)!
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
            dateComponents.hour = h
            dateComponents.minute = m
        print(dateComponents)
            let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let nom = String(Int(arc4random_uniform(1000000)))
            let request2 = UNNotificationRequest(identifier: nom , content: content, trigger: notificationTrigger)
            // Schedule the request.
            let center = UNUserNotificationCenter.current()
            center.add(request2) { (error : Error?) in
                if let theError = error {
                    print(theError.localizedDescription)
                }
            }
        
        
    }
}
