//
//  AjouterMedecinViewController.swift
//  Swift Project
//
//  Created by Melvil on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class AjouterMedecinViewController: UIViewController {

    @IBOutlet weak var nomMedecinTextField: UITextField!
    @IBOutlet weak var prenomMedecinTextField: UITextField!
    @IBOutlet weak var titreMedecinTextField: UITextField!
    @IBOutlet weak var telMedecinTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let alert = UIAlertController(title: "Oh oh!", message:"Veuillez remplir tous les champs", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
        if ( identifier == "ajoutMedecinSegue"){
            
            guard nomMedecinTextField.hasText else{
                self.present(alert, animated: true){}
                return false
            }
            guard prenomMedecinTextField.hasText else{
                self.present(alert, animated: true){}
                return false
            }
            guard titreMedecinTextField.hasText else{
                self.present(alert, animated: true){}
                return false
            }
            guard telMedecinTextField.hasText else{
                self.present(alert, animated: true){}
                return false
            }
            
        }
        return true
        
    }
    
    
    /**
     permet de sauvegarder un médecin grâce au dao
     */
    @IBAction func saveMedecin(_ sender: Any) {
        let daoF = CoreDataDAOFactory.getInstance()
        let medecinDAO = daoF.getMedecinDAO()
        let medecin: Medecin = medecinDAO.create()
        
        medecin.nomMedecin = nomMedecinTextField.text
        medecin.prenomMedecin = prenomMedecinTextField.text
        medecin.titreMedecin = titreMedecinTextField.text
        medecin.telephoneMedecin = telMedecinTextField.text
        
        
        do{
            try medecinDAO.save(medecin: medecin)
            
        }catch{
        }
        
    }
    
   

    

}
