//
//  ResumeMedicamentViewController.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 26/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ResumeMedicamentViewController: UIViewController {

    @IBOutlet weak var nomMedoc: UILabel!
    @IBOutlet weak var doseMedoc: UILabel!
    @IBOutlet weak var heuresMedoc: UILabel!
    @IBOutlet weak var joursMedoc: UILabel!
    @IBOutlet weak var dateDbtMedoc: UILabel!
    @IBOutlet weak var dateFinMedoc: UILabel!
    
    @IBOutlet weak var descriptionBreve: UITextView!
    var medicament : Medicament?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        dateFormatter.timeZone = TimeZone.current

        
        
        self.nomMedoc.text = medicament?.a?.libelleTypeMedicament;
        self.doseMedoc.text = medicament?.aUneDose?.libelleDoseMedicament
        self.descriptionBreve.text = medicament?.presentationMedicament
        
        self.dateDbtMedoc.text = dateFormatter.string(from: (medicament?.dateDebutMedicament!)!)
        self.dateFinMedoc.text = dateFormatter.string(from: (medicament?.dateFinMedicament!)!)
        
        var heuresFinales = ""
        if let heures = medicament?.aPrendreA {
            for h in heures{
                if let heure = h as? Heure{
                    dateFormatter.dateFormat = "HH:mm"
                    let selectedDate = dateFormatter.string(from: heure.libelleHeure!)
                    if ( heuresFinales != ""){
                        heuresFinales = heuresFinales + ", " // prepare plusieurs heures
                    }
                    heuresFinales = heuresFinales + selectedDate
                    
                }
            }
        }
        self.heuresMedoc.text = heuresFinales 

        
//    faire date et heure
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
