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
    var listeJoursActivite : [String] = []
    var listeHeuresActivite: [String] = []
    var dateChoisi = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        labelActivite.text = nomActivite.libelleTypeActivite

        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
    }
    let showJourActiviteSegue = "DateFinActiviteSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourActiviteSegue {
            let dateFinAlarmActivite = segue.destination as! ActiviteDateFinViewController
            dateFinAlarmActivite.nomActivite = nomActivite
            dateFinAlarmActivite.listeJoursActivite = listeJoursActivite
            dateFinAlarmActivite.listeHeuresActivite = listeHeuresActivite
           // dateFinAlarmActivite.dateDebutActivite = dateChoisi
        }
    }
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        dateChoisi = selectedDate
        print(dateChoisi
        )
        
    }

}
