//
//  AjoutSuiviDatabaseViewController.swift
//  Swift Project
//
//  Created by Melvil on 04/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class SymptomeAjoutViewController: UIViewController {
    
    
    var nomSuiviSend : TypeSymptome! // typeSymptome sent by segue
    var heureSuiviSend = Date() // heure sent by segue
    var dateSuiviSend = Date() // date sent by segue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationItem.setHidesBackButton(true, animated:true);
        self.saveNewSymptome( withNom : self.nomSuiviSend, withHeure: self.heureSuiviSend, withDate : self.dateSuiviSend)
        // Do any additional setup after loading the view.
    }
    //fonction ajoutant les informations dans les données persistantes grâce au DAO
    func saveNewSymptome( withNom nom: TypeSymptome, withHeure heure: Date,withDate date: Date){
     
        let daoF = CoreDataDAOFactory.getInstance()
        let symptomeDAO = daoF.getSymptomeDAO()
        let symptome: Symptome = symptomeDAO.create()
        
        symptome.heureSymptome = heure
        symptome.dateSymptome = date
        symptome.aUnType = nom
        
        do{
            try symptomeDAO.save(symptome: symptome)
        }catch{
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
