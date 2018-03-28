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
    var joursActivite : Date?

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self

        getListeActivite()

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mesActivites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(describing: self.activites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath){
        
        performSegue(withIdentifier: "descriptionActiviteSegue", sender: self)
        print("did select row after")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "descriptionActiviteSegue" {
            let activiteDestination = segue.destination as! ResumeActiviteViewController
        activiteDestination.activite = mesActivites[(myTableView.indexPathForSelectedRow?.row)!]
        }
        
    }

    /**
     permet d'avoir toutes les activité ajoutées par le patient
     utilise la dao factory pour créer un dao d'activité
     ## Important Notes ##
     1. Both parameters are **double** numbers.
     2. For a proper result the second parameter *must be other than 0*.
     3. If the second parameter is 0 then the function will return nil.
     
     */
    
    func getListeActivite(){
        let daoF = CoreDataDAOFactory.getInstance()
        let activiteDAO = daoF.getActiviteDAO()
        
        
        do{
            try self.mesActivites = activiteDAO.getAll()!
        }catch{}
        
        for activite in mesActivites{
            if (activite.dateDebut != nil && activite.dateFin != nil){
                
                
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        
        dateFormatter.timeZone = TimeZone.current
        
        selectedDateDebut = dateFormatter.string(from: activite.dateDebut!)
        
        selectedDateFin = dateFormatter.string(from: activite.dateFin!)
        typeActivite = activite.estDeType?.libelleTypeActivite
        
        if let heures = activite.sePasseA {
            for h in heures{
                if let heure = h as? Heure{
                    dateFormatter.dateFormat = "HH:mm"
                    let selectedDate = dateFormatter.string(from: heure.libelleHeure!)
                    print(selectedDate)
                    print(activite)
                    activites.append(  typeActivite! + " du " + selectedDateDebut + " au " + selectedDateFin + " à " + selectedDate)
                    
                        }
                    }
                }
                
            }
        }
    }
    

}
