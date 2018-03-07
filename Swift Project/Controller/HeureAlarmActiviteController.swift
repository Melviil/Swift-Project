//
//  HeureAlarmActiviteController.swift
//  Swift Project
//
//  Created by Melvil on 28/02/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class HeureAlarmActiviteController: UIViewController, UITableViewDataSource {
    
    var nomActivite = TypeActivite() ;
    var listeJoursActivite : [String] = [];
    var hours: [String] = []

 
    @IBOutlet weak var labelActivite: UILabel!
    @IBOutlet weak var TableViewHours: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(listeJoursActivite)
        labelActivite.text = nomActivite.libelleTypeActivite
        print(nomActivite)
        print(listeJoursActivite)
       


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
        print("I'm back")

        let newHeure = segue.source as! AjoutHeureModallyControllerViewController
        print(newHeure.heureChoisie)
        hours.append(newHeure.heureChoisie)
        TableViewHours.reloadData()
        
    }
    let showJourActiviteSegue = "DateDebutActiviteSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourActiviteSegue {
            let dateDebutAlarmActivite = segue.destination as! DateDebutActiviteViewController
            dateDebutAlarmActivite.nomActivite = nomActivite
            dateDebutAlarmActivite.listeJoursActivite = listeJoursActivite
            dateDebutAlarmActivite.listeHeuresActivite = hours
            
        }
        
    }
    

}
