//
//  ChoixDateSymptomeViewController.swift
//  Swift Project
//
//  Created by Melvil on 04/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class SymptomeDateViewController: UIViewController {
    
  
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    var nomSuiviSend = String() // nom sent by segue
    var heureSuiviSend = String() // heure sent by segue
    var dateChoisi = "" // date getted now
    
    let segueShowNomSuivi = "showAllInfosSuiviSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self) //au cas où l'utilisateur garde la date préséléctionnée
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomSuivi {
            let AjoutSuiviDatabase = segue.destination as! SymptomeAjoutViewController
            AjoutSuiviDatabase.nomSuiviSend = self.nomSuiviSend
            AjoutSuiviDatabase.heureSuiviSend = self.heureSuiviSend
            AjoutSuiviDatabase.dateSuiviSend = self.dateChoisi

        }
        
    }
    
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        dateChoisi = selectedDate
        
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
