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
   
    var heureChoisie = String() // contient l'heure choisie par 
    
    /**
     permet de revenit à la page précédente si on ne veut pas ajouter d'heurees
     */
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
    
    
    /**
     permet d'avoir dans la variable selectedDate la date que l'utilisateur choisi dans le pickerView
     */
    @IBAction func changerValueDateQuandDateChange(_ sender: Any) {
   
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        dateFormatter.timeZone = TimeZone.current
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        heureChoisie = selectedDate
       
    }
   

    


    

}
