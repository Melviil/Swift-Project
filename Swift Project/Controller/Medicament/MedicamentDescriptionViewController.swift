//
//  MedicamentAjouterDescriptionViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class MedicamentDescriptionViewController: UIViewController {
    
    let segueDescriptionMedoc = "ShowDescriptionMedicamentSegue"

    @IBOutlet weak var libelleMedicament: UITextField!
    @IBOutlet weak var presentationDetailleMedicament: UITextField!
    @IBOutlet weak var presentationBreveMedicament: UITextField!
    
    @IBOutlet weak var DoseMedicament: UITextField!
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let alert = UIAlertController(title: "Oh oh!", message:"Veuillez remplir tous les champs", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
        if ( identifier == segueDescriptionMedoc){
            guard libelleMedicament.hasText else{
                self.present(alert, animated: true){}
                return false
            }
          
            guard libelleMedicament.hasText else{
                self.present(alert, animated: true){}
                return false
            }
          
            guard presentationDetailleMedicament.hasText else{
                self.present(alert, animated: true){}
                return false
            }
            guard presentationBreveMedicament.hasText else{
                self.present(alert, animated: true){}
                return false
            }
            
        }
        return true
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueDescriptionMedoc {
            let medicamentHeure = segue.destination as! MedicamentHeureViewController
            medicamentHeure.libelleMedicamentPasse = self.libelleMedicament.text!
            medicamentHeure.presentationBreveMedicamentPasse = self.presentationBreveMedicament.text!
            medicamentHeure.DoseMedicamentPasse = self.DoseMedicament.text!
            medicamentHeure.presentationDetailleMedicamentPasse = self.presentationDetailleMedicament.text!
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
