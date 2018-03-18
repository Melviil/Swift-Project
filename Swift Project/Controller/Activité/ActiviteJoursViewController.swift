//
//  AlarmActivite.swift
//  Swift Project
//
//  Created by Melvil on 26/02/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class ActiviteJoursViewController: UIViewController {

    @IBOutlet weak var labelActivite: UILabel!
    
    let showJourActiviteSegue = "showJourActiviteSegue";
    
    var nomActivite = TypeActivite() ;
    var joursActivite : [Jour] = [];
    var jour11 : String = "" ;

    
    @IBOutlet weak var lunSwitch: UISwitch!
    
    @IBOutlet weak var marSwitch: UISwitch!
    
    @IBOutlet weak var merSwitch: UISwitch!
    
    @IBOutlet weak var jeuSwitch: UISwitch!
    
    @IBOutlet weak var venSwitch: UISwitch!
    
    @IBOutlet weak var samSwitch: UISwitch!
    
    @IBOutlet weak var dimSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelActivite.text = nomActivite.libelleTypeActivite
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourActiviteSegue {
            let heureAlarmActivite = segue.destination as! ActiviteHeuresViewController
            heureAlarmActivite.nomActivite = nomActivite
            heureAlarmActivite.listeJoursActivite = joursActivite
            valideHeureActivite(self)
            

            heureAlarmActivite.listeJoursActivite = joursActivite

            
        }
        
    }
    
    @IBAction func valideHeureActivite(_ sender: Any) {
        let daoF = CoreDataDAOFactory.getInstance()
        let patientDAO = daoF.getJourDAO()
        
        if lunSwitch.isOn {
           try? joursActivite.append(patientDAO.getByName(jourParametre: "Lundi")![0])
        }
        if marSwitch.isOn {
            try? joursActivite.append(patientDAO.getByName(jourParametre: "Mardi")![0])
        }
        if merSwitch.isOn {
            try? joursActivite.append(patientDAO.getByName(jourParametre: "Mercredi")![0])
        }
        if jeuSwitch.isOn {
            try? joursActivite.append(patientDAO.getByName(jourParametre: "Jeudi")![0])
        }
        if venSwitch.isOn {
            try? joursActivite.append(patientDAO.getByName(jourParametre: "Vendredi")![0])
        }
        if samSwitch.isOn {
            try? joursActivite.append(patientDAO.getByName(jourParametre: "Samedi")![0])
        }
        if dimSwitch.isOn {
            try? joursActivite.append(patientDAO.getByName(jourParametre: "Dimanche")![0])
        }
        print(joursActivite)
        print(jour11)
        print("ON A FAIT LA FCT")


    }
    
}
