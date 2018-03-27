//
//  ChoixDateSymptomeViewController.swift
//  Swift Project
//
//  Created by Melvil on 04/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData
class SymptomeDateViewController: UIViewController {
    
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    var nomSuiviSend : TypeSymptome! // type sent by segue
    var heureSuiviSend = Date() // heure sent by segue
    var dateChoisi = Date() // date getted now
    
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
        let date = dateFormatter.string(from: myDatePicker.date)
        dateChoisi = dateFormatter.date(from : date)!
}



}
