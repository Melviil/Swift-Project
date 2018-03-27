//
//  DateFinActiviteViewController.swift
//  Swift Project
//
//  Created by Melvil on 07/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class ActiviteDateFinViewController: UIViewController {
    @IBOutlet weak var labelActivite: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!

    var nomActivite = TypeActivite()
    var listeJoursActivite : [Jour] = []
    var listeHeuresActivite: [String] = []
    var dateDebutActivite = String()
    var dateChoisi = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        labelActivite.text = nomActivite.libelleTypeActivite
        changerValueDateQuandDateChange(self)

    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        dateChoisi = selectedDate
        
    }
    
    let showJourActiviteSegue = "AjoutActiviteSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourActiviteSegue {
            let ajoutActivite = segue.destination as! ActiviteAjoutViewController
            ajoutActivite.nomActivite = nomActivite
            ajoutActivite.listeJoursActivite = listeJoursActivite
            ajoutActivite.listeHeuresActivite = listeHeuresActivite
            ajoutActivite.dateDebutActivite = dateDebutActivite
            ajoutActivite.dateFinActivite = dateChoisi

        }
    }

}
