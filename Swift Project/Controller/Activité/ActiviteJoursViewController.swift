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
    var joursActivite : [String] = [];
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
        if lunSwitch.isOn {
            joursActivite.append("Lundi")
        }
        if marSwitch.isOn {
            joursActivite.append("Mardi")
        }
        if merSwitch.isOn {
            joursActivite.append("Mercredi")
        }
        if jeuSwitch.isOn {
            joursActivite.append("Jeudi")
        }
        if venSwitch.isOn {
            joursActivite.append("Vendredi")
        }
        if samSwitch.isOn {
            joursActivite.append("Samedi")
        }
        if dimSwitch.isOn {
            joursActivite.append("Dimanche")
        }
        print(joursActivite)
        print(jour11)
        print("ON A FAIT LA FCT")


    }
    
}
