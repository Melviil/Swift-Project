//
//  RDVListeViewController.swift
//  Swift Project
//
//  Created by Melvil on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class RDVListeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var rdvs: [RendezVous]?
    var rdvString : [String] = []
    
    @IBOutlet weak var rdvListeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rdvListeTableView.dataSource = self
        rdvListeTableView.delegate = self
        loadAllRdv()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(describing: self.rdvString[indexPath.row])
        return cell
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rdvString.count
    }
    
    
    /**
     permet d'avoir toutes les rendez-vous ajoutées par le patient
     utilise la dao factory pour créer un dao rendez vous
     
     
     */
    func loadAllRdv() {
        let daoF = CoreDataDAOFactory.getInstance()
        let rdvDao = daoF.getRendezVousDAO()
        
        
        do{
            try self.rdvs = rdvDao.getAll()!
        }catch{}
        
        
        for rdv in rdvs!{
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM"
            dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
            dateFormatter.timeZone = TimeZone.current
            
            
            let heureFormatter = DateFormatter()
            heureFormatter.dateFormat = "HH:mm"
            heureFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
            heureFormatter.timeZone = TimeZone.current
            
            let heureRdv = heureFormatter.string(from :rdv.heureRDV!)
            let tpsPrArriverRdv = heureFormatter.string(from :rdv.tpsPourArriver!)
            let medecin = rdv.avec?.nomMedecin
            let dateRdv = dateFormatter.string(from : rdv.dateRdv!)
            
            rdvString.append("Dr " + medecin! + " à " + heureRdv + " le " + dateRdv )
        }
    }

}
