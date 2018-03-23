//
//  MedicamentAjoutViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class MedicamentAjoutViewController: UIViewController {
    var medicamentPasse = Medicament()
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
        saveNewMedicament(withNom: self.libelleMedicamentPasse, withPresentationBreve: self.presentationBreveMedicamentPasse, withPresentationDetaille: self.presentationDetailleMedicamentPasse, withDose: self.nbPriseMedicamentPasse, withFrequence: self.frequencePriseMedicamentPasse, withHours: self.heuresPasse, withDateDebut: self.dateDebutPasse, withDateFin: self.dateFinPasse)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveNewMedicament( withNom nom: String, withPresentationBreve presentationBreve : String, withPresentationDetaille presentationDetaille : String, withDose dose : String, withFrequence frequence : String , withHours heures : [String] , withDateDebut dateDebut: String, withDateFin dateFin: String){
        
        let daoF = CoreDataDAOFactory.getInstance()
        let medicamentDAO = daoF.getMedicamentDAO()
        let medicament: Medicament = medicamentDAO.create()
        
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
        
       let heureDAO = daoF.getHeureDAO()

        
        for uneHeure in heures {
            let heure: Heure = heureDAO.create()
            //On repasse la date en Date
            guard let heureGood = dateFormatter.date(from:uneHeure) else {
                fatalError("ERROR: Date conversion failed due to mismatched format.")
            }
//            self.ajouterNotif(jour: 1,heure: calendar.component(.hour, from: heureGood), minute: calendar.component(.minute, from: heureGood))
            heure.libelleHeure = heureGood
            do{
                try heureDAO.save(heure: heure)
            }catch{
            }
            do{
                try medicamentDAO.addHeureMedicament(heure: heure, medicament: medicament)
            }catch {
                
            }
            
        } 
        
        //fin conversion heures/jous
        medicament.presentationBreveMedicament = presentationBreve
        medicament.presentationMedicament = presentationDetailleMedicamentPasse
        medicament.doseMedicament = dose
        medicament.frequenceMedicament = frequence
        medicament.dateFinMedicament = dateFinGood
        medicament.dateDebutMedicament = dateDebutGood
        
        
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "HH mm"
        
     
        do{
            try medicamentDAO.save(medicament: medicament)
        }catch{
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
