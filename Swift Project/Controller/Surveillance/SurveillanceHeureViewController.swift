//
//  SurveillanceHeureViewController.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class SurveillanceHeureViewController: UIViewController {
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    var heureChoisie = Date()
    let segueShowNomSuivi = "showNomHeureSurveillanceSegue"
    var nomSurveillanceSend : TypeSurveillance!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self) //au cas où l'utilisateur garde l'heure préséléctionnée
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomSuivi {
            let SurveillanceDateViewController = segue.destination as! SurveillanceDateViewController
            SurveillanceDateViewController.nomSurveillanceSend = self.nomSurveillanceSend
            SurveillanceDateViewController.heureSurveillanceSend = self.heureChoisie
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        
        heureChoisie = myDatePicker.date
        
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
