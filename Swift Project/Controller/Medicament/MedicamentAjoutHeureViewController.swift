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
    // fonction appelé à chaque fois que l'heure est changé.
    // La valeur heureChoisie aura constemment la valeur de l'heure affiche à l'écran
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        heureChoisie = selectedDate
        
        
    }
    
    // supprime le modally
    @IBAction func CancelButton(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
    }


}
