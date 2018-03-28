//
//  ChoixHeureSymptomeViewController.swift
//  Swift Project
//
//  Created by Melvil on 04/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class SymptomeHeureViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    var heureChoisie = Date()
    let segueShowNomSuivi = "showNomHeureSuiviSegue"
    var nomSuiviSend : TypeSymptome!

    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self) //au cas où l'utilisateur garde l'heure préséléctionnée

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomSuivi {
            let ChoixDateSuivi = segue.destination as! SymptomeDateViewController
            ChoixDateSuivi.nomSuiviSend = self.nomSuiviSend
            ChoixDateSuivi.heureSuiviSend = self.heureChoisie
           

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // fonction appelé à chaque fois que l'heure est changé.
    // La valeur heureChoisie aura constemment la valeur de l'heure affiche à l'écran
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        dateFormatter.timeZone = TimeZone.current

        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        heureChoisie = dateFormatter.date(from: selectedDate)!
    }

}
