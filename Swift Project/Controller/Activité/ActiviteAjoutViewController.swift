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
    var listeJoursActivite : [String] = []
    var listeHeuresActivite: [String] = []
    var dateDebutActivite = String()
    var dateFinActivite = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options : [.alert, .sound, .badge], completionHandler : {didAllow, error in})
        self.navigationItem.setHidesBackButton(true, animated:true);
        print("INFORMATIONS AJOUT")
        print(nomActivite)
        print(listeJoursActivite)
        print(listeHeuresActivite)
        print(dateDebutActivite)
        print(dateFinActivite)
           saveNewActivite(withNom : self.nomActivite, withHours : listeHeuresActivite, withJours : self.listeJoursActivite, withDateDebut: self.dateDebutActivite, withDateFin : self.dateFinActivite )
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TODO
    func saveNewActivite( withNom nom: TypeActivite, withHours heures : [String], withJours jours : [String],withDateDebut dateDebut: String, withDateFin dateFin: String){
        
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            //  self.alertError(errorMsg: " Could not save symptome ", userInfo : "Unknown reason" )
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let activite = Activite(context : context)
        let heureTable = Heure(context : context)
        let jourTable = Jour(context : context)


        // On convertit les dates de string à date
        // La time zone est celle de Lisbonne, après des tests c'est celle qui correspond
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "WET")! as TimeZone
        guard let dateFinGood = dateFormatter.date(from:dateFin) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        guard let dateDebutGood = dateFormatter.date(from:dateDebut) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
      
        

        
        print( "lalalalalalalalala")
        print(nom)
        activite.dateFin = dateFinGood
        activite.dateDebut = dateDebutGood
        activite.estDeType = nom
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "HH mm"

        for heure in heures {
            let calendar = Calendar.current
            guard let heureGood = dateFormatter.date(from:heure) else {
                fatalError("ERROR: Date conversion failed due to mismatched format.")
            }
           
            self.ajouterNotif(jour: 1,heure: calendar.component(.hour, from: heureGood), minute: calendar.component(.minute, from: heureGood))
            heureTable.libelleHeure = heureGood
            activite.addToSePasseA(heureTable)
        } 
        for jour in jours {
            jourTable.libelleJour = jour
            activite.addToSePasseLe(jourTable)
        }
      
        do{
            try context.save()
        }
        catch  {
            //  self.alertError(errorMsg: " Could not save type ", userInfo : "Unknown reason" )
            return
        }
      
    }
   public func ajouterNotif(jour j : Int, heure h: Int, minute m: Int){
        let content = UNMutableNotificationContent()
        content.title = self.nomActivite.libelleTypeActivite!
        content.body = "Pensez à faire votre scéance de sport!"
        content.badge = 1
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
      //  let request  = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
       // UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        
        // add notification for Mondays at 11:00 a.m.
        var dateComponents = DateComponents()
        dateComponents.weekday = j
        dateComponents.hour = h
        dateComponents.minute = m
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request2 = UNNotificationRequest(identifier: "notification1", content: content, trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: nil)
    }



}
