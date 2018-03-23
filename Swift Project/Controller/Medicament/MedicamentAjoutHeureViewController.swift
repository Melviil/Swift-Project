//
//  MedicamentAjoutHeureViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class MedicamentAjoutHeureViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changerValueDateQuandDateChange(self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        changerValueDateQuandDateChange(self)
        // Dispose of any resources that can be recreated.
    }
      @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBOutlet weak var pressButton: UIButton!
    
    var heureChoisie = ""
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        heureChoisie = selectedDate
        
        
    }
    
    
    @IBAction func CancelButton(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
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
