
//
//  ChoixTypeSuiviController.swift
//  Swift Project
//
//  Created by Melvil on 03/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class SymptomeTypeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
   
    
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [TypeSymptome] = []
    
    let segueShowNomSuivi = "showNomSuiviSegue"

    var nomSuivi : TypeSymptome!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomSuivi {
            let ChoixHeureSuivi = segue.destination as! SymptomeHeureViewController
            ChoixHeureSuivi.nomSuiviSend = self.nomSuivi
            print(nomSuivi)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        
        //GET type symtpome
        let daoF = CoreDataDAOFactory.getInstance()
        let typeSymptomeDAO = daoF.getTypeSymptomeDAO()
        do{
            try pickerData = typeSymptomeDAO.getAll()!
        }catch {
            
        }
        self.nomSuivi=pickerData[0]
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
        return pickerData[row].libelleTypeSymptome
    }
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        nomSuivi = pickerData[row]
    }


}
