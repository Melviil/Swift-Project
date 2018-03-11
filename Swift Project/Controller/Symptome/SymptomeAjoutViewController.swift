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
    
    
    var nomSuiviSend = String() // nom sent by segue
    var heureSuiviSend = String() // heure sent by segue
    var dateSuiviSend = "" // date sent by segue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.nomSuiviSend)
        print(self.heureSuiviSend)
        print(self.dateSuiviSend)
        self.saveNewSymptome( withNom : self.nomSuiviSend, withHeure: self.heureSuiviSend, withDate : self.dateSuiviSend)
        // Do any additional setup after loading the view.
    }
    func saveNewSymptome( withNom nom: String, withHeure heure: String,withDate date: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            //  self.alertError(errorMsg: " Could not save symptome ", userInfo : "Unknown reason" )
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let symptome = Symptome(context : context)
        symptome.heureSymptome = nom
        symptome.dateSymptome = heure
        symptome.typeSymptome = date
        
        do{
            try context.save()
        }
        catch {
            //TODO gérer les erreurs
            
            return
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
