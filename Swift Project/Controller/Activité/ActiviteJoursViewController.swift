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
    var joursActivite : [Jour] = []; // tableau qui va contenir tous les jours avce des switchs allumés
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
  
    
    /**
     un pop up est affiché si aucun des switch de la page n'a été allumé
     
     */
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        valideHeureActivite(self)

        if self.joursActivite == [] {
            let alert = UIAlertController(title: "Oh oh!", message:"Veuillez ajouter au moins un jour", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
            self.present(alert, animated: true){}
            return false
        }
        return true
    }
    
    
    /**
     permet d'envoyer des données au controlleur suivant
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showJourActiviteSegue {
            let heureAlarmActivite = segue.destination as! ActiviteHeuresViewController
            heureAlarmActivite.nomActivite = nomActivite
            heureAlarmActivite.listeJoursActivite = joursActivite
            valideHeureActivite(self)
            heureAlarmActivite.listeJoursActivite = joursActivite
 
        }
    }
    
    
    
    /**
        en fonction des switch allumés, retourne le jour correspondant au libellé
     
     */
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


    }
    
}
