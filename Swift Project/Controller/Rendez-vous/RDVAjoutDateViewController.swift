//
//  RDVAjoutDateViewController.swift
//  Swift Project
//
//  Created by Melvil on 22/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import UIKit
class RDVAjoutDateViewController: UIViewController {
    
    var nomDocteurTFSent = String()
    var typeRDVSent = String()
    var numDocteurSent = String()
    var dateChoisi = String()
    var heureChoisieSent = String()
    var tempsPourArriverRDVSent = String()
    
    
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self)
        print(nomDocteurTFSent)
        print(typeRDVSent)
        print(numDocteurSent)
        print(heureChoisieSent)
        print(dateChoisi)
        print(tempsPourArriverRDVSent)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        dateChoisi = selectedDate
        print(dateChoisi)
        
    }
    
    let AjoutRdvSegue = "AjoutRdvSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == AjoutRdvSegue {
            let RDVAjoutViewController = segue.destination as! RDVAjoutViewController
            
            RDVAjoutViewController.nomDocteurTFSent = self.nomDocteurTFSent
            RDVAjoutViewController.numDocteurSent = self.numDocteurSent
            RDVAjoutViewController.typeRDVSent = self.typeRDVSent
            RDVAjoutViewController.tempsPourArriverRDVSent = self.tempsPourArriverRDVSent
            RDVAjoutViewController.heureChoisieSent = self.heureChoisieSent
            RDVAjoutViewController.dateChoisiSent = self.dateChoisi

            
            
        }
    }
}
