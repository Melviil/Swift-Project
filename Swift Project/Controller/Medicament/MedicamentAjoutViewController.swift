//
//  MedicamentAjoutViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class MedicamentAjoutViewController: UIViewController {
    var presentationBreveMedicamentPasse = String()
    var presentationDetailleMedicamentPasse = String()
    var heuresPasse: [String] = []
    var dateDebutPasse = String()
    var dateFinPasse = String()
    var doseMedicSend : DoseMedicament!
    var nomMedicSend : TypeMedicament!
    let calendar = Calendar.current

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options : [.alert, .sound, .badge], completionHandler : {didAllow, error in})
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
        
        saveNewMedicament(withType: nomMedicSend, withPresentationBreve: presentationBreveMedicamentPasse, withDose: doseMedicSend, withPresentationDetaille: presentationDetailleMedicamentPasse, withHeures: heuresPasse, withDateDebut: dateFinPasse, withDateFin: dateFinPasse)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveNewMedicament( withType type: TypeMedicament, withPresentationBreve presentationBreve : String, withDose dose : DoseMedicament, withPresentationDetaille presentationDetaille : String, withHeures heures : [String],  withDateDebut dateDebut: String, withDateFin dateFin: String){
       
        let daoF = CoreDataDAOFactory.getInstance()
        let medicamentDAO = daoF.getMedicamentDAO()
        let medicament: Medicament = medicamentDAO.create()
        let heureDAO = daoF.getHeureDAO()
        
        
        medicament.presentationMedicament = presentationDetaille
        medicament.presentationBreveMedicament = presentationBreve
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone.current
        guard let dateFinGood = dateFormatter.date(from:dateFinPasse) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        guard let dateDebutGood = dateFormatter.date(from:dateDebutPasse) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        
        
        medicament.dateFinMedicament = dateFinGood
        medicament.dateDebutMedicament = dateDebutGood
        do{
            try medicamentDAO.addDoseMedicament(doseMedicament: dose, medicament: medicament)
        }catch{
        }
        do{
            try   medicamentDAO.addTypeMedicament(typeMedicament: type, medicament: medicament)
        }catch{
        }
        
        
        
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
                try medicamentDAO.addHeureMedicament(heure:  heure, medicament: medicament)
            }catch {
                
            }
            self.ajouterNotif( heure: calendar.component(.hour, from: heureGood), minute: calendar.component(.minute, from: heureGood))
        }
        
        
    }
   public func ajouterNotif(heure h: Int, minute m: Int){
        let content = UNMutableNotificationContent()
        content.title = self.nomMedicSend.libelleTypeMedicament! + self.doseMedicSend.libelleDoseMedicament!
        content.body = "Pensez à prendre votre medicament"
        content.badge = 1
        
        // add notification for Mondays at 11:00 a.m.
        var dateComponents = DateComponents()
    
    for day in 1...7{
        dateComponents.day = day
        dateComponents.hour = h
        dateComponents.minute = m
        print(day)
        print(h)
        print(m)
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let id = "notif" + String(day)
        let request2 = UNNotificationRequest(identifier: id, content: content, trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: nil)
    }
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
