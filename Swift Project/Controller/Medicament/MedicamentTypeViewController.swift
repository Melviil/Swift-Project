//
//  MedicamentTypeViewController.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class MedicamentTypeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var myPickerView: UIPickerView!
    var pickerData: [TypeMedicament] = []
    let segueShowNomSuivi = "showDoseMedicSegue"
    
    var nomMedic : TypeMedicament!
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView.delegate = self
        
        
        //GET type symtpome
        let daoF = CoreDataDAOFactory.getInstance()
        let typeMedicamentDAO = daoF.getTypeMedicamentDAO()
        do{
            try pickerData = typeMedicamentDAO.getAll()!
        }catch {
            
        }
        self.nomMedic=pickerData[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        return pickerData[row].libelleTypeMedicament
    }
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        nomMedic = pickerData[row]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomSuivi {
            let doseMedic = segue.destination as! MedicamentDoseViewController
            doseMedic.nomMedicSend = self.nomMedic
            
        }
        
    }
    
    
}
