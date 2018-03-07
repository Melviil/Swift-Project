//
//  HeureAlarmActiviteController.swift
//  Swift Project
//
//  Created by Melvil on 28/02/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class ActiviteHeuresViewController: UIViewController, UITableViewDataSource {
    
    var nomActivite = TypeActivite() ;
    var listeJoursActivite : [String] = [];
    var hours: [String] = []

 
    @IBOutlet weak var labelActivite: UILabel!
    @IBOutlet weak var TableViewHours: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        labelActivite.text = nomActivite.libelleTypeActivite       


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


    
   // executé au retour du modally
    @IBAction func unwindToHourListAfterSavingHour(segue: UIStoryboardSegue){
        let newHeure = segue.source as! ActiviteHeureModallyViewController
        print(newHeure.heureChoisie)
        hours.append(newHeure.heureChoisie)
        TableViewHours.reloadData()
        
    }
    let showJourActiviteSegue = "DateDebutActiviteSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourActiviteSegue {
            let dateDebutAlarmActivite = segue.destination as! ActiviteDateDebutViewController
            dateDebutAlarmActivite.nomActivite = nomActivite
            dateDebutAlarmActivite.listeJoursActivite = listeJoursActivite
            dateDebutAlarmActivite.listeHeuresActivite = hours
            
        }
        
    }
    

}
