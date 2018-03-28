//
//  RDVAjoutTempsViewController.swift
//  Swift Project
//
//  Created by Melvil on 22/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//
import UIKit
import Foundation

class RDVAjoutTempsViewController: UIViewController {
    
   
    var heureChoisie = ""
    var medecinSent : Medecin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        changerValueHeureWhenHeureChange(self)
        
    }
    
    @IBOutlet weak var ajoutHeureRDV: UIButton!
    @IBOutlet weak var RDVtempsdatePicker: UIDatePicker!
    
    
    
    
    let AjoutTpsPourArriverSegue = "AjoutTpsPourArriverSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == AjoutTpsPourArriverSegue {
            let AjoutHeureViewController = segue.destination as! RDVAjoutHeureViewController
        
           
            AjoutHeureViewController.medecinSent = self.medecinSent
            AjoutHeureViewController.tempsPourArriverRDV = self.heureChoisie
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     permet d'avoir dans la variable heureChoisie l`heure que l'utilisateur choisi dans le pickerView
     */
    @IBAction func changerValueHeureWhenHeureChange(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        let selectedDate = dateFormatter.string(from: RDVtempsdatePicker.date)
        heureChoisie = selectedDate
        
    }
    
}
