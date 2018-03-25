//
//  MedicamentAjoutViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class MedicamentAjoutViewController: UIViewController {
    var presentationBreveMedicamentPasse = String()
    var presentationDetailleMedicamentPasse = String()
    var heuresPasse: [String] = []
    var dateDebutPasse = String()
    var dateFinPasse = String()
    var doseMedicSend : DoseMedicament!
    var nomMedicSend : TypeMedicament!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
