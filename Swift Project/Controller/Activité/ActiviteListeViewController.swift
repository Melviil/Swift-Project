//
//  ActiviteListeViewController.swift
//  Swift Project
//
//  Created by Melvil on 12/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class ActiviteListeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var activites: [String] = []
    var mesActivites : [Activite] = []
     var selectedDateDebut = String()
     var selectedDateFin = String()
    var typeActivite : String?

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        //TODO GETActivite table
        
        
        myTableView.dataSource = self
        myTableView.delegate = self
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            //Ajouter une error a display
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request  : NSFetchRequest<Activite> = Activite.fetchRequest()
        
        do{
            try self.mesActivites = context.fetch(request)
        }
        catch{
            return
        }
        
        for activite in mesActivites{
            if (activite.dateDebut != nil && activite.dateFin != nil){
                
            
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy"
                dateFormatter.timeZone = NSTimeZone(name: "WET")! as TimeZone

                selectedDateDebut = dateFormatter.string(from: activite.dateDebut!)

                selectedDateFin = dateFormatter.string(from: activite.dateFin!)
                print(selectedDateDebut)
                print(selectedDateFin)
                //    typeActivite = activite.estDeType?.libelleTypeActivite
                //print(typeActivite)
                activites.append( "du " + selectedDateDebut + " jusqu'au " + selectedDateFin)
            }
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
        return activites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(describing: self.activites[indexPath.row])
        return cell
    }

}
