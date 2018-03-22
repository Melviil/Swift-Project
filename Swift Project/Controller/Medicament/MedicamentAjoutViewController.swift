//
//  MedicamentAjoutViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class MedicamentAjoutViewController: UIViewController {
    var libelleMedicamentPasse = String()
    var presentationBreveMedicamentPasse = String()
    var DoseMedicamentPasse = String()
    var presentationDetailleMedicamentPasse = String()
    var nbPriseMedicamentPasse = String()
    var frequencePriseMedicamentPasse = String()
    var heuresPasse: [String] = []
    var dateDebutPasse = String()
    var dateFinPasse = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
        
        saveNewMedicament(withLibelle: libelleMedicamentPasse, withPresentationBreve: presentationBreveMedicamentPasse, withDose: DoseMedicamentPasse, withPresentationDetaille: presentationDetailleMedicamentPasse, withHeures: heuresPasse, withNbPrise : nbPriseMedicamentPasse, withFrequence: frequencePriseMedicamentPasse, withDateDebut: dateFinPasse, withDateFin: dateFinPasse)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveNewMedicament( withLibelle libelle: String, withPresentationBreve presentationBreve : String, withDose dose : String, withPresentationDetaille presentationDetaille : String, withHeures heures : [String],withNbPrise nbprise : String, withFrequence frequence : String,  withDateDebut dateDebut: String, withDateFin dateFin: String){
       
        let daoF = CoreDataDAOFactory.getInstance()
        let medicamentDAO = daoF.getMedicamentDAO()
        let medicament: Medicament = medicamentDAO.create()
        let heureDAO = daoF.getHeureDAO()
        
        
        medicament.presentationMedicament = presentationDetaille
        medicament.presentationBreveMedicament = presentationBreve
      
        medicament.doseMedicament = dose
        medicament.nomMedicament = libelle
        medicament.frequenceMedicament = frequence
        
        
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
        
        
        
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "HH mm"
        
        for uneHeure in heures {
            let heure: Heure = heureDAO.create()
            let calendar = Calendar.current
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
