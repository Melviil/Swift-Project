//
//  DateDebutActiviteViewController.swift
//  Swift Project
//
//  Created by Melvil on 07/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class ActiviteDateDebutViewController: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var labelActivite: UILabel!
    var nomActivite = TypeActivite()
    var listeJoursActivite : [Jour] = []
    var listeHeuresActivite: [String] = []
    var dateChoisi = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelActivite.text = nomActivite.libelleTypeActivite
        changerValueDateQuandDateChange(self)

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    let showJourActiviteSegue = "DateFinActiviteSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourActiviteSegue {
            let dateFinAlarmActivite = segue.destination as! ActiviteDateFinViewController
            dateFinAlarmActivite.nomActivite = nomActivite
            dateFinAlarmActivite.listeJoursActivite = listeJoursActivite
            dateFinAlarmActivite.listeHeuresActivite = listeHeuresActivite
            dateFinAlarmActivite.dateDebutActivite = dateChoisi
        }
    }
    
    /**
     met la date dans la variable date choisi la date prise dans le date picker
     */
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
       
        dateChoisi = selectedDate

        
    }

}
