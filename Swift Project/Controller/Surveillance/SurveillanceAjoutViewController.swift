//
//  SurveillanceAjoutViewController.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class SurveillanceAjoutViewController: UIViewController {
    var nomSurveillanceSend : TypeSurveillance! // nom sent by segue
    var heureSurveillanceSend = Date() // heure sent by segue
    var dateSurveillanceSend = Date() // date sent by segue
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.saveNewSurveillance( withNom : self.nomSurveillanceSend, withHeure: self.heureSurveillanceSend, withDate : self.dateSurveillanceSend)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    @IBAction func revenirMenu(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
    }
    
    func saveNewSurveillance( withNom nom: TypeSurveillance, withHeure heure: Date,withDate date: Date) {

        let daoF = CoreDataDAOFactory.getInstance()
        let surveillanceDAO = daoF.getSurveillanceDAO()
        let surveillance : Surveillance = surveillanceDAO.create()
        
        surveillance.heureSurveillance = heure
        surveillance.dateSurveillance = date
        
        
        
        do{
            try surveillanceDAO.addTypeSurveillanceASurveillance(surveillance: surveillance, typeSurveillance : nom)
        }catch{
        }

        
        do{
            try surveillanceDAO.save(surveillance: surveillance)

        }catch {
        }
        
    }
    

}
