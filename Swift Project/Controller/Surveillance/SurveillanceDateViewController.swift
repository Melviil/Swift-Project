//
//  SurveillanceDateViewController.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class SurveillanceDateViewController: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!
    var nomSurveillanceSend : TypeSurveillance! // nom sent by segue
    var heureSurveillanceSend = Date() // heure sent by segue
    var dateChoisi = Date() // date getted now
    
    let segueShowNomSuivi = "showAllInfosSurveillanceSegue"
    
    let saveNewSurveillance = "saveNewSurveillance"
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self) //au cas où l'utilisateur garde la date préséléctionnée
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //fonction qui prépare l'envoie aux données vers le controller SurveillanceAjoutViewControler
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == saveNewSurveillance {
            let SurveillanceAjoutViewController = segue.destination as! SurveillanceAjoutViewController
            
            SurveillanceAjoutViewController.nomSurveillanceSend = self.nomSurveillanceSend
            SurveillanceAjoutViewController.heureSurveillanceSend = self.heureSurveillanceSend
            SurveillanceAjoutViewController.dateSurveillanceSend = self.dateChoisi
            
        }
        
    }
    // fonction appelé à chaque fois que l'heure est changé.
    // La valeur dateChoisie aura constemment la valeur de la date affiche à l'écran
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        
        dateFormatter.timeZone = TimeZone.current
        
        let date = dateFormatter.string(from: myDatePicker.date)
        dateChoisi = dateFormatter.date(from : date)!
    }
 

}
