//
//  ResumeActiviteViewController.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 27/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class ResumeActiviteViewController: UIViewController {

    @IBOutlet weak var activiteNom: UILabel!
    @IBOutlet weak var heureActivteTextField: UILabel!
    @IBOutlet weak var jourActiviteTextField: UILabel!
    @IBOutlet weak var dateDbtActiviteTF: UILabel!
    
    @IBOutlet weak var dateFinActiviteTF: UILabel!
    
    var activite : Activite!
    
    @IBAction func supprimerActivite(_ sender: Any) {
        
        let daoF = CoreDataDAOFactory.getInstance()
        let activiteDAO = daoF.getActiviteDAO()
        
        do{
            try activiteDAO.remove(activite: activite)

        }catch{
        }
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("activite")
        self.activiteNom.text = activite.estDeType?.libelleTypeActivite
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        
        dateFormatter.timeZone = TimeZone.current
        
        
      print("date debut")
        
        self.dateDbtActiviteTF.text = dateFormatter.string(from: activite.dateDebut!)
        self.dateFinActiviteTF.text = dateFormatter.string(from: activite.dateFin!)

        
         var heuresFinales = ""
        if let heures = activite.sePasseA {
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
        var joursFinales = ""

        if let heures = activite.sePasseLe {
            for h in heures{
                if let heure = h as? Jour{
                    dateFormatter.dateFormat = "dd:MM:yyy"
                    let selectedDate = heure.libelleJour
                    if ( joursFinales != ""){
                        joursFinales = joursFinales + ", " // prepare plusieurs heures
                    }
                    joursFinales = joursFinales + selectedDate!
                    
                }
            }
        }
        self.heureActivteTextField.text = heuresFinales
        self.jourActiviteTextField.text = joursFinales

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
