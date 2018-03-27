//
//  MedicamentListeViewController.swift
//  Swift Project
//
//  Created by Melvil on 23/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class MedicamentListeViewController: UIViewController, UITableViewDataSource  {
   
    
    var mesMedicaments : [Medicament] = []
    var affichageMedicaments : [String] = []
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            //Ajouter une error a display
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request  : NSFetchRequest<Medicament> = Medicament.fetchRequest()
        
        do{
            try self.mesMedicaments = context.fetch(request)
        }
        catch{
            return
        }
        
        
        for medicament in mesMedicaments{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM"
            dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
            
            dateFormatter.timeZone = TimeZone.current
            var heuresFinales = ""
            let date = dateFormatter.string(from: medicament.dateFinMedicament!)
            if let heures = medicament.aPrendreA {
                for h in heures{
                    if let heure = h as? Heure{
                        dateFormatter.dateFormat = "HH:mm"
                        let selectedDate = dateFormatter.string(from: heure.libelleHeure!)
                        if ( heuresFinales != ""){
                                heuresFinales = heuresFinales + ", " // prepare plusieurs heures
                        }
                        heuresFinales = heuresFinales + selectedDate
                        
                    }
                }
            }
            affichageMedicaments.append( (medicament.a?.libelleTypeMedicament!)! + " " + (medicament.aUneDose?.libelleDoseMedicament!)! + " à " + heuresFinales + " jusqu'au " + date )
        }
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return affichageMedicaments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(describing: self.affichageMedicaments[indexPath.row])
        return cell
    }
    



}
