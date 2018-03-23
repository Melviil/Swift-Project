//
//  RDVAjoutHeureViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 12/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import Foundation

class RDVAjoutInfosViewController: UIViewController {

 
    
    @IBOutlet weak var nomDocteurTF: UITextField!
    @IBOutlet weak var typeRDV: UITextField!
    @IBOutlet weak var numDocteur: UITextField!
    
    @IBAction func rdvRegulier(_ sender: Any) {
    }
    
    
    @IBOutlet weak var ajoutHeureBoutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let segueDescriptionRdv = "ajoutHeureRdv"
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let alert = UIAlertController(title: "Oh oh!", message:"Veuillez remplir tous les champs", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
        if ( identifier == segueDescriptionRdv){
            guard nomDocteurTF.hasText else{
                self.present(alert, animated: true){}
                return false
            }
            guard typeRDV.hasText else{
                self.present(alert, animated: true){}
                return false
            }
            guard numDocteur.hasText else{
                self.present(alert, animated: true){}
                return false
            }
        }
        return true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueDescriptionRdv {
            let Rdvtemps = segue.destination as! RDVAjoutTempsViewController
                Rdvtemps.nomDocteurTFSent = self.nomDocteurTF.text!
                Rdvtemps.numDocteurSent = self.numDocteur.text!
                Rdvtemps.typeRDVSent = self.typeRDV.text!
        }
        
    }
  


}
