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
    
    var nomDocteurTFSent = String()
    var typeRDVSent = String()
    var numDocteurSent = String()
    var heureChoisie = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(nomDocteurTFSent)
        print(typeRDVSent)
        print(numDocteurSent)
        changerValueHeureWhenHeureChange(self)
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ajoutHeureRDV: UIButton!
    @IBOutlet weak var RDVtempsdatePicker: UIDatePicker!
    
    
    
    
    let AjoutTpsPourArriverSegue = "AjoutTpsPourArriverSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == AjoutTpsPourArriverSegue {
            let AjoutHeureViewController = segue.destination as! AjoutHeureViewController
        
            AjoutHeureViewController.nomDocteurTFSent = self.nomDocteurTFSent
            AjoutHeureViewController.numDocteurSent = self.numDocteurSent
            AjoutHeureViewController.typeRDVSent = self.typeRDVSent
            AjoutHeureViewController.tempsPourArriverRDV = self.heureChoisie
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func changerValueHeureWhenHeureChange(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        let selectedDate = dateFormatter.string(from: RDVtempsdatePicker.date)
        heureChoisie = selectedDate
        
    }
    
}
