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
        
        print("datedebut medicament ajoutVC")
        print(dateDebut)
        
        print("dateFin")
        print(dateFin)
        print(dateFinPasse)
        
        guard let dateFinGood = dateFormatter.date(from:dateFinPasse) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        guard let dateDebutGood = dateFormatter.date(from:dateDebutPasse) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        
        
        medicament.dateFinMedicament = dateFinGood
        medicament.dateDebutMedicament = dateDebutGood
        print("datedebutGood medicament ajoutVC")
        print(dateDebutGood)
        print("dateFinGood")
        print(dateFinGood)
        
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
            
            do{
              try  medicamentDAO.save(medicament: medicament)
            }catch{
                
            }
            //self.ajouterNotif( heure: calendar.component(.hour, from: heureGood), minute: calendar.component(.minute, from: heureGood))
             //self.createRappels(heureDebut: heureGood, heureFin: dateDebutGood, dateFin: dateFinGood)
          //  self.test(date: Calendar.current.date(byAdding: .day, value: -1, to: dateDebutGood)!)
          //  self.test(date: Calendar.current.date(byAdding: .day, value: -1, to: dateFinGood)!)
            self.ajouterNotif( heure: calendar.component(.hour, from: heureGood), minute: calendar.component(.minute, from: heureGood), dateDebut: dateDebutGood, dateFin : dateFinGood)

        }
        
       
        
    }
    public func ajouterNotif(heure h: Int, minute m: Int, dateDebut : Date, dateFin : Date){
        let content = UNMutableNotificationContent()
        content.title = self.nomMedicSend.libelleTypeMedicament! + " " + self.doseMedicSend.libelleDoseMedicament!
        content.body = "Pensez à prendre votre medicament"
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
            dateComponents.month = components.month!
            dateComponents.day = components.day!
            dateComponents.year = components.year!
            dateComponents.hour = h
            dateComponents.minute = m
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
                startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
            }
           
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
   /* func test(date : Date){
        var datelala = date // first date
        let endDate = Date() // last date
        
        // Formatter for printing the date, adjust it according to your needs:
        let fmt = DateFormatter()
        fmt.dateFormat = "dd/MM/yyyy"
        
        while datelala <= endDate {
            print(fmt.string(from: datelala))
            datelala = Calendar.date(byAdding: .day, value: 1, to: datelala)!
        }
    } */

