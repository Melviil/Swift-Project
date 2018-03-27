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
    @IBOutlet weak var descriptionBreve: UILabel!
    
    var medicament : Medicament?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!

        
        dateFormatter.timeZone = TimeZone.current
        
        self.nomMedoc.text = medicament?.a?.libelleTypeMedicament;
        self.doseMedoc.text = medicament?.aUneDose?.libelleDoseMedicament
        self.descriptionBreve.text = medicament?.presentationMedicament
        
        self.dateDbtMedoc.text = dateFormatter.string(from: (medicament?.dateDebutMedicament!)!)
        self.dateFinMedoc.text = dateFormatter.string(from: (medicament?.dateFinMedicament!)!)

        
//    faire date et heure
        
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
