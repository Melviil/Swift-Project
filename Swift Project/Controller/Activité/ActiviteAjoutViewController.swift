//
//  ActiviteAjoutViewController.swift
//  Swift Project
//
//  Created by Melvil on 07/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class ActiviteAjoutViewController: UIViewController {
    var nomActivite = TypeActivite()
    var listeJoursActivite : [Jour] = []
    var listeHeuresActivite: [String] = []
    var dateDebutActivite = String()
    var dateFinActivite = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options : [.alert, .sound, .badge], completionHandler : {didAllow, error in})
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        saveNewActivite(withNom : self.nomActivite, withHours : listeHeuresActivite, withJours : self.listeJoursActivite, withDateDebut: self.dateDebutActivite, withDateFin : self.dateFinActivite )
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     sauvegarde la vouvelle activité dans la bd à partir de tous les champs remplis précédemment
     @param nom, correspond au typeActivite
     @param heures les heures choisis pour l'activité
     @param jours, les jours choisis pour pratiquer l'activité
     @param datedebut la date ou il faudrait commencer l'activite
    @param datefin la date ou il faudrait arreter de faire l'acitivte
     

     */
    func saveNewActivite( withNom nom: TypeActivite, withHours heures : [String], withJours jours : [Jour],withDateDebut dateDebut: String, withDateFin dateFin: String){
        let daoF = CoreDataDAOFactory.getInstance()
        let activiteDAO = daoF.getActiviteDAO()
        let activite: Activite = activiteDAO.create()
        let heureDAO = daoF.getHeureDAO()


        // On convertit les drates de string à date
        // La time zone est celle de Lisbonne, après des tests c'est celle qui correspond
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone.current
        guard let dateFinGood = dateFormatter.date(from:dateFin) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        guard let dateDebutGood = dateFormatter.date(from:dateDebut) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
      

    //fin conversion heures/jous
        activite.dateFin = dateFinGood
        activite.dateDebut = dateDebutGood
        activite.estDeType = nom
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "HH mm"

        for uneHeure in heures {
            let heure: Heure = heureDAO.create()
            //On repasse la date en Date
            guard let heureGood = dateFormatter.date(from:uneHeure) else {
                fatalError("ERROR: Date conversion failed due to mismatched format.")
            }
            
            heure.libelleHeure = heureGood
            do{
                try heureDAO.save(heure: heure)
            }catch{
            }
            do{
                try activiteDAO.addHeureActivite(heure:  heure, activite: activite)
            }catch {
                
            }

        } 
        for jour in jours {

            do{
                try activiteDAO.addJourActivite(jour: jour, activite: activite)
            }catch {
            
            }
        }
        do{
            try activiteDAO.save(activite: activite)
        }catch{
        }
      // désolé c'est pas très beau ( mais ça marche )
        let calendar = NSCalendar.current

        for jour in jours{
            for heure in heures{
                guard let heureGood = dateFormatter.date(from:heure) else {
                    fatalError("ERROR: Date conversion failed due to mismatched format.")
                }
                self.ajouterNotif( heure: calendar.component(.hour, from: heureGood), minute: calendar.component(.minute, from: heureGood), jour : Int(jour.idJour),dateDebut: dateDebutGood, dateFin : dateFinGood)
            }
        }
    }
   

    @IBAction func enelverModally(_ sender: Any) {
            self.dismiss(animated:true, completion: nil)
        
    }
    
    
    
    /**
     permet d'ajouter une notification pour rappeler l'activité
     @param h les heures choisis pour notifier l'activité
     @param m les minutes choisis pour notifier l'activité
     @param jours, les jours choisis pour notifier l'activité
     @param datedebut la date ou il faudrait commencer à notifier l'activite
     @param la date ou il faudrait arreter de notifier l'acitivte
     
     */
    public func ajouterNotif(heure h: Int, minute m: Int, jour j : Int, dateDebut : Date, dateFin : Date){
        let content = UNMutableNotificationContent()
        content.title = self.nomActivite.libelleTypeActivite!
        content.body = "Pensez à effectuer votre sport"
        content.badge = 1
        let fmt = DateFormatter()
        fmt.dateFormat = "dd/MM/yyyy"
        var dateComponents = DateComponents()
        var startDate = dateDebut // first date
        let endDate = dateFin // last date
        while startDate <= endDate {
            print(fmt.string(from: startDate))
            let calendar = NSCalendar.current
            let components = calendar.dateComponents([.day, .month, .year], from: startDate)
            let startDateWeekDate = Calendar.current.component(.weekday, from: startDate)
            if (j == startDateWeekDate ){
                // On regarde si le jour est bien le jour de la semaine
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
            startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!

        }
        
    }

}
