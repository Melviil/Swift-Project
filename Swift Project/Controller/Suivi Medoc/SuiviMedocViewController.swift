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
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nbMedocOublie.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
            print("lalalalal")
            try? suiviMedicamentDAO.save(suiviMedicament: suivifinal)
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
