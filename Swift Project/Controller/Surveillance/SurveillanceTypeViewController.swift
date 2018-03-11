//
//  SurveillanceTypeViewController.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class SurveillanceTypeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    let segueShowNomSuivi = "showNomSurveillanceSegue"
    var nomSurveillance = ""
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomSuivi {
            let SurveillanceHeureViewController = segue.destination as! SurveillanceHeureViewController
            SurveillanceHeureViewController.nomSurveillanceSend = self.nomSurveillance
            print(nomSurveillance)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        pickerData = ["mettre", "les", "maladies", "OUBLIE"]
        self.nomSurveillance=pickerData[0]
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
        return pickerData[row]
    }
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        nomSurveillance = pickerData[row]
    }

}
