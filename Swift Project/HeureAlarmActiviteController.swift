//
//  HeureAlarmActiviteController.swift
//  Swift Project
//
//  Created by Melvil on 28/02/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class HeureAlarmActiviteController: UIViewController {
    
    @IBOutlet weak var TableViewHours: UITableView!
    @IBAction func unwindToHourListAfterSavingHour(segue: UIStoryboardSegue){
        print("I'm back")
        let newHeure = segue.source as! AjoutHeureModallyControllerViewController
        print(newHeure.heureChoisie)
        
    }
    

}
