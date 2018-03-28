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
    let segueShowNomSuivi = "showDateSurveillanceSegue"
    var nomSurveillanceSend : TypeSurveillance!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self) //au cas où l'utilisateur garde l'heure préséléctionnée
        
        // Do any additional setup after loading the view.
    }
    //fonction qui prépare l'envoie aux données vers le controller SurveillanceDateViewControler
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
    // fonction appelé à chaque fois que l'heure est changé.
    // La valeur heureChoisie aura constemment la valeur de l'heure affiche à l'écran
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        dateFormatter.timeZone = TimeZone.current
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        heureChoisie = dateFormatter.date(from: selectedDate)!
        
    }

    

}
