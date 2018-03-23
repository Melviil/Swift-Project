//  RDVAjoutHeureViewController.swift
//  Swift Project
//
//  Created by Melvil on 22/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import UIKit

class AjoutHeureViewController: UIViewController {
    
    @IBOutlet weak var myPickerDate: UIDatePicker!
    var nomDocteurTFSent = String()
    var typeRDVSent = String()
    var numDocteurSent = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self)
        print(nomDocteurTFSent)
        print(typeRDVSent)
        print(numDocteurSent)
        print(heureChoisie)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var heureChoisie = ""
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        let selectedDate = dateFormatter.string(from: myPickerDate.date)
        heureChoisie = selectedDate
        
        
    }
}

