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
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
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
            print("walla ca marche pas")
        }
        
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
