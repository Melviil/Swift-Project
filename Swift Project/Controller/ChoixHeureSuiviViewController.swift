//
//  ChoixHeureSymptomeViewController.swift
//  Swift Project
//
//  Created by Melvil on 04/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class ChoixHeureSuiviViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    var heureChoisie = ""
    let segueShowNomSuivi = "showNomHeureSuiviSegue"
    var nomSuiviSend = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomSuivi {
            let ChoixDateSuivi = segue.destination as! ChoixDateSuiviViewController
            ChoixDateSuivi.nomSuiviSend = self.nomSuiviSend
            ChoixDateSuivi.heureSuiviSend = self.heureChoisie
           

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh mm a"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        heureChoisie = selectedDate
        print(heureChoisie)
        
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
