
//
//  MedicamentDoseViewController.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class MedicamentDoseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var myPickerView: UIPickerView!
    var pickerData: [DoseMedicament] = []
    let segueShowNomSuivi = "showDescMedicSegue"
    var nomMedicSend : TypeMedicament!
    var doseMedic : DoseMedicament!
    var doses : [DoseMedicament] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView.delegate = self
        
        
        //GET type symtpome
        let daoF = CoreDataDAOFactory.getInstance()
        let DoseMedicamentDAO = daoF.getDoseMedicamentDAO()
            doses = DoseMedicamentDAO.getAllByMedicament(nmedic: nomMedicSend)
        for dose in doses {
            pickerData.append(dose)
        }
            print(pickerData)
        self.doseMedic=pickerData[0]
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].libelleDoseMedicament
    }
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        doseMedic = pickerData[row]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomSuivi {
            let descriptionMedic = segue.destination as! MedicamentDescriptionViewController
            descriptionMedic.nomMedicSend = self.nomMedicSend
            descriptionMedic.doseMedicSend = self.doseMedic
            
        }
        
    }
    
}

