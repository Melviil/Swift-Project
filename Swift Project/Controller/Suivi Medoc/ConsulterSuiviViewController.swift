//
//  ConsulterSuiviViewController.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 26/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class ConsulterSuiviViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

    var suiviString: [String] = []
    var suivis : [SuiviMedicament]?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        suiviMedicamentTableView.dataSource = self
        suiviMedicamentTableView.delegate = self
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            //Ajouter une error a display
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request  : NSFetchRequest<SuiviMedicament> = SuiviMedicament.fetchRequest()
        
        do{
            try self.suivis = context.fetch(request)
        }
        catch{
            return
        }
        
        for s in suivis!{
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM"
            dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
            dateFormatter.timeZone = TimeZone.current
            
            
            let dateSuivi = dateFormatter.string(from: s.dateSuiviMedicament!)
            let typeSuivi = s.typeSuiviMedicament
            let nbprise = s.nbPriseOubli
            
            if nbprise == nil {
                suiviString.append(" le " + dateSuivi + " le patient a pris " + typeSuivi! )
            }
            else{
                suiviString.append(" le " + dateSuivi + " le patient a oublié " + nbprise! + "prises" )
            }
            
            
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var suiviMedicamentTableView: UITableView!
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suiviString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(describing: self.suiviString[indexPath.row])
        return cell
    }
    

}
