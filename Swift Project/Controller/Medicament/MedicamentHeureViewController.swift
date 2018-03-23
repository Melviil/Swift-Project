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
        hours.append(newHeure.heureChoisie)
        tableViewHours.reloadData()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(describing: self.hours[indexPath.row])
        return cell
    }

   
    let showJourMadicamentSegue = "AjoutDateDebutSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showJourMadicamentSegue {
            let MedicamentDateDebutViewController = segue.destination as! MedicamentDateDebutViewController
            MedicamentDateDebutViewController.libelleMedicamentPasse = self.libelleMedicamentPasse
            MedicamentDateDebutViewController.presentationBreveMedicamentPasse = self.presentationBreveMedicamentPasse
            MedicamentDateDebutViewController.DoseMedicamentPasse = self.DoseMedicamentPasse
            MedicamentDateDebutViewController.presentationDetailleMedicamentPasse = self.presentationDetailleMedicamentPasse
            MedicamentDateDebutViewController.nbPriseMedicamentPasse = self.nbPriseMedicamentPasse
            MedicamentDateDebutViewController.frequencePriseMedicamentPasse = self.frequencePriseMedicamentPasse
            MedicamentDateDebutViewController.heuresPasse = self.hours
            
        }
    }
}
