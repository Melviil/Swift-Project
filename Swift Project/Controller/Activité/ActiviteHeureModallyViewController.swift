//
//  AjoutHeureModallyControllerViewController.swift
//  Swift Project
//
//  Created by Melvil on 01/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class ActiviteHeureModallyViewController: UIViewController {

   
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var pressButton: UIButton!
   
    var heureChoisie = String()
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
   
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        dateFormatter.timeZone = TimeZone.current
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        heureChoisie = selectedDate
       
    }
   
    
    @IBAction func CancelButton(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
    }
    override func viewDidLoad() {
        changerValueDateQuandDateChange(self)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


    

}
