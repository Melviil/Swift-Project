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
        dateFormatter.dateFormat = "hh mm a"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        heureChoisie = selectedDate
       
    }
   
    
    @IBAction func CancelButton(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
