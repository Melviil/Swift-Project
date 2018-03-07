//
//  DateDebutActiviteViewController.swift
//  Swift Project
//
//  Created by Melvil on 07/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class DateDebutActiviteViewController: UIViewController {
    var nomActivite = TypeActivite()
    var listeJoursActivite : [String] = []
    var listeHeuresActivite: [String] = []
    var dateChoisi = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Activité date debut ")
        print(nomActivite)
        print(listeJoursActivite)
        print(listeHeuresActivite)
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
    }
    let showJourActiviteSegue = "DateFinActiviteSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourActiviteSegue {
            let dateFinAlarmActivite = segue.destination as! DateDebutActiviteViewController
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
