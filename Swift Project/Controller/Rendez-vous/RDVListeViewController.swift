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

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            //Ajouter une error a display
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request  : NSFetchRequest<RendezVous> = RendezVous.fetchRequest()
        
        do{
            try self.rdvs = context.fetch(request)
        }
        catch{
            return
        }
        
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
            

           rdvString.append("Dr " + medecin! + " à " + heureRdv + ". Partez" + tpsPrArriverRdv + "avant" )
        }
        
            

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rdvString.count
    }
    

}
