//
//  MedicamentHeureViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class MedicamentHeureViewController: UIViewController, UITableViewDataSource {
    
    var hours: [String] = []

    @IBOutlet weak var tableViewHours: UITableView!
    var medicamentPasse = Medicament() 
    
    var libelleMedicamentPasse = String()
    var presentationBreveMedicamentPasse = String()
    var DoseMedicamentPasse = String()
    var presentationDetailleMedicamentPasse = String()
    var nbPriseMedicamentPasse = String()
    var frequencePriseMedicamentPasse = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // executé au retour du modally
    @IBAction func unwindToHourListAfterSavingHour(segue: UIStoryboardSegue){
        let newHeure = segue.source as! MedicamentAjoutHeureViewController
        print(newHeure.heureChoisie)
        hours.append(newHeure.heureChoisie)
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        }
        
    }
}
