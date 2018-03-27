//
//  SuiviMedocViewController.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 26/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class SuiviMedocViewController: UIViewController {

    @IBOutlet weak var toutesLesPrises: UISwitch!
    @IBOutlet weak var laPlusPart: UISwitch!
    @IBOutlet weak var QuelquesPrises: UISwitch!
    @IBOutlet weak var aucunePrise: UISwitch!
    @IBOutlet weak var nbPrise: UISwitch!
    
    @IBOutlet weak var nbMedocOublie: UITextField!
    
    @IBAction func nbOubli(_ sender: Any) {
        if nbPrise.isOn {
            nbMedocOublie.isHidden = false
        }else {
            nbMedocOublie.isHidden = true
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nbMedocOublie.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     enregistre le suivi en fonction de la date d'aujourdhui
     
     ### Usage Example: ###
     ````
     si le switch toutes les prises est ON, on enregistre en bd que le jour X, le patient a pris toutes les prises de médicaments
     ````
     */
    
    
    @IBAction func enregistrerSuivi(_ sender: Any) {
        
        let daoF = CoreDataDAOFactory.getInstance()
        let suiviMedicamentDAO = daoF.getSuiviMedicamentDAO()
        let suivifinal = suiviMedicamentDAO.create()
        
        
        let dateToday = Date()
        suivifinal.dateSuiviMedicament = dateToday

        if toutesLesPrises.isOn{
            suivifinal.typeSuiviMedicament = "toutes Les Prises"
        }
        if laPlusPart.isOn{
            suivifinal.typeSuiviMedicament = "la Plus part"
        }
        if QuelquesPrises.isOn{
            suivifinal.typeSuiviMedicament = "quelques prises"
        }
        if aucunePrise.isOn{
            suivifinal.typeSuiviMedicament = "aucune prise"
        }
        if nbPrise.isOn{
            suivifinal.typeSuiviMedicament = "oubli de prises"
            suivifinal.nbPriseOubli = nbMedocOublie.text
        }
        
        do {
            try? suiviMedicamentDAO.save(suiviMedicament: suivifinal)
        }
    }
    

}
