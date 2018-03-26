//
//  RDVAjoutViewController.swift
//  Swift Project
//
//  Created by Melvil on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

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
        
        guard let dateChoisiSent = dateFormatter.date(from:dateChoisiSent) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        guard let heureChoisie = heureFormatter.date(from:heureChoisieSent) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        guard let tempsPourArriverRDV = heureFormatter.date(from:tempsPourArriverRDVSent) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        
        
        rendezVous.dateRdv = dateChoisiSent
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
        
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }
}
