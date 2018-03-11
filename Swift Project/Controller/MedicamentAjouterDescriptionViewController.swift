//
//  MedicamentAjouterDescriptionViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class MedicamentAjouterDescriptionViewController: UIViewController {
    
    let segueDescriptionMedoc= "ShowDescriptionMedicamentSegue"
    var medicamentPasse = Medicament() ;
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueDescriptionMedoc {
            let medicamentHeure = segue.destination as! MedicamentHeureViewController
            medicamentHeure.medicamentPasse = medicamentPasse
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
