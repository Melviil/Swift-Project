//  RDVAjoutHeureViewController.swift
//  Swift Project
//
//  Created by Melvil on 22/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import UIKit

class RDVAjoutHeureViewController: UIViewController {
    
    @IBOutlet weak var heureRdvDatePicker: UIDatePicker!
    @IBOutlet weak var heureRDVDatePicker: UIDatePicker!
    
    var medecinSent : Medecin?
    var tempsPourArriverRDV = String()
    var heureChoisie = ""
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self)
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     permet d'avoir dans la variable heureChoisie l`heure que l'utilisateur choisi dans le pickerView
     */
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        let selectedDate = dateFormatter.string(from: heureRDVDatePicker.date)
        heureChoisie = selectedDate
        
            }

    let AjoutDateRdvSegue = "AjoutDateRdvSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == AjoutDateRdvSegue {
            let RDVAjoutDateViewController = segue.destination as! RDVAjoutDateViewController
            
         
            RDVAjoutDateViewController.tempsPourArriverRDVSent = self.tempsPourArriverRDV
            RDVAjoutDateViewController.heureChoisieSent = self.heureChoisie
            RDVAjoutDateViewController.medecinSent = self.medecinSent

            
            
        }
    }

    
}

