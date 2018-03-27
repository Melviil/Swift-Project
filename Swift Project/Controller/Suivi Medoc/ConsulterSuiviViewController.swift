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
    var suivis: [SuiviMedicament]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        suiviMedicamentTableView.dataSource = self
        suiviMedicamentTableView.delegate = self
        
        let daoF = CoreDataDAOFactory.getInstance()
        let suiviMedicamentDAO = daoF.getSuiviMedicamentDAO()
        
        
        do{
            try self.suivis = suiviMedicamentDAO.getAll()!
        }catch{}
        
        // Do any additional setup after loading the view.
        
       
        
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
        // Dispose of any resources that can be recreated.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
