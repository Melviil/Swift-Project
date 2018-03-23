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
    var libelleMedicamentPasse = String()
    var presentationBreveMedicamentPasse = String()
    var DoseMedicamentPasse = String()
    var presentationDetailleMedicamentPasse = String()
    var heuresPasse: [String] = []
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
    
    let showJourActiviteSegue = "AjoutDateFinSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourActiviteSegue {
            let MedicamentDateFinViewController = segue.destination as! MedicamentDateFinViewController
            
            MedicamentDateFinViewController.libelleMedicamentPasse = self.libelleMedicamentPasse
            MedicamentDateFinViewController.presentationBreveMedicamentPasse = self.presentationBreveMedicamentPasse
            MedicamentDateFinViewController.DoseMedicamentPasse = self.DoseMedicamentPasse
            MedicamentDateFinViewController.presentationDetailleMedicamentPasse = self.presentationDetailleMedicamentPasse
            MedicamentDateFinViewController.heuresPasse = self.heuresPasse
            MedicamentDateFinViewController.dateDebutPasse = self.dateChoisi
            
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
