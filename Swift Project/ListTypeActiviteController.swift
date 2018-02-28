//
//  ListTypeActiviteController.swift
//  Swift Project
//
//  Created by Melvil on 26/02/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class ListTypeActiviteController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  var myLabel = "football"
    
   
    @IBOutlet weak var picker: UIPickerView!
    
    
    
    var typesactivite : [TypeActivite] = []
    override func viewDidLoad() {
        
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request  : NSFetchRequest<TypeActivite> = TypeActivite.fetchRequest()
        
        do{
            try self.typesactivite = context.fetch(request)
        }
        catch{
            return
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typesactivite.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typesactivite[row].libelleTypeActivite
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}
