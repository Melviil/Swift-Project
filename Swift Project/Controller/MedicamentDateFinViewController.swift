//
//  MedicamentDateFinViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class MedicamentDateFinViewController: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!

    var medicamentPasse = Medicament()
    var libelleMedicamentPasse = String()
    var presentationBreveMedicamentPasse = String()
    var DoseMedicamentPasse = String()
    var presentationDetailleMedicamentPasse = String()
    var nbPriseMedicamentPasse = String()
    var frequencePriseMedicamentPasse = String()
    var heuresPasse: [String] = []
    var dateDebutPasse = String()
    var dateChoisi = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let showJourActiviteSegue = "AjoutMedicamentSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourActiviteSegue {
            let MedicamentAjoutViewController = segue.destination as! MedicamentAjoutViewController
            
            MedicamentAjoutViewController.medicamentPasse = self.medicamentPasse
            MedicamentAjoutViewController.libelleMedicamentPasse = self.libelleMedicamentPasse
            MedicamentAjoutViewController.presentationBreveMedicamentPasse = self.presentationBreveMedicamentPasse
            MedicamentAjoutViewController.DoseMedicamentPasse = self.DoseMedicamentPasse
            MedicamentAjoutViewController.presentationDetailleMedicamentPasse = self.presentationDetailleMedicamentPasse
            MedicamentAjoutViewController.nbPriseMedicamentPasse = self.nbPriseMedicamentPasse
            MedicamentAjoutViewController.frequencePriseMedicamentPasse = self.frequencePriseMedicamentPasse
            MedicamentAjoutViewController.heuresPasse = self.heuresPasse
            MedicamentAjoutViewController.dateDebutPasse = self.dateDebutPasse
            MedicamentAjoutViewController.dateFinPasse = self.dateChoisi
            
        }
    }
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        dateChoisi = selectedDate
        print(dateChoisi)

        
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
