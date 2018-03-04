//
//  HeureAlarmActiviteController.swift
//  Swift Project
//
//  Created by Melvil on 28/02/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class HeureAlarmActiviteController: UIViewController, UITableViewDataSource {
    
   
    
    @IBOutlet weak var TableViewHours: UITableView!
    var hours: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.hours[indexPath.row]
        return cell
    }


    
   
    @IBAction func unwindToHourListAfterSavingHour(segue: UIStoryboardSegue){
        print("I'm back")
        let newHeure = segue.source as! AjoutHeureModallyControllerViewController
        print(newHeure.heureChoisie)
        hours.append(newHeure.heureChoisie)
        TableViewHours.reloadData()
        
    }
    

}
