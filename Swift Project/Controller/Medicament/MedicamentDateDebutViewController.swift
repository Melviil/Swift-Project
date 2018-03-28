//
//  MedicamentDateDebutViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class MedicamentDateDebutViewController: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!
    var presentationBreveMedicamentPasse = String()
    var presentationDetailleMedicamentPasse = String()
    var heuresPasse: [String] = []
    var dateChoisi = String()
    var doseMedicSend : DoseMedicament!
    var nomMedicSend : TypeMedicament!
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let showJourActiviteSegue = "AjoutDateFinSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourActiviteSegue {
            let MedicamentDateFinViewController = segue.destination as! MedicamentDateFinViewController
            
            print("medicament date debut segue: date debut ")
            print(self.dateChoisi)

            MedicamentDateFinViewController.presentationBreveMedicamentPasse = self.presentationBreveMedicamentPasse
            MedicamentDateFinViewController.presentationDetailleMedicamentPasse = self.presentationDetailleMedicamentPasse
            MedicamentDateFinViewController.heuresPasse = self.heuresPasse
            MedicamentDateFinViewController.dateDebutPasse = self.dateChoisi
            MedicamentDateFinViewController.nomMedicSend = self.nomMedicSend
            MedicamentDateFinViewController.doseMedicSend = self.doseMedicSend
            
        }
    }
    // fonction appelé à chaque fois que l'heure est changé.
    // La valeur dateChoisie aura constemment la valeur de la date affiche à l'écran
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        dateChoisi = selectedDate
        
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
