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
    @IBOutlet weak var myDatePicker: NSLayoutConstraint!
    var nomActivite = TypeActivite()
    var listeJoursActivite : [String] = []
    var listeHeuresActivite: [String] = []
    var dateDebutActivite = String()
    var dateChoisi = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        labelActivite.text = nomActivite.libelleTypeActivite
        changerValueDateQuandDateChange(self)

        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
       /* let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        dateChoisi = selectedDate
        print(dateChoisi) */
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
