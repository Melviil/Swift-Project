//
//  RDVAjoutHeureViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 12/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class RDVAjoutInfosViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
  
    
    @IBOutlet weak var docteurChoisis: UIPickerView!
    

    
    var medecins: [Medecin] = []
    var medecinPasse : Medecin?
    
    @IBOutlet weak var ajoutHeureBoutton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docteurChoisis.dataSource = self
        docteurChoisis.delegate = self
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            //Ajouter une error a display
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request  : NSFetchRequest<Medecin> = Medecin.fetchRequest()
        
        do{
            try self.medecins = context.fetch(request)
            if self.medecins.isEmpty == false {
                self.medecinPasse = self.medecins[0]
            }
        }
        catch{
            return
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let segueDescriptionRdv = "ajoutHeureRdv"
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        let alert = UIAlertController(title: "Oh oh!", message:"Veuillez remplir tous les champs", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
//        if ( identifier == segueDescriptionRdv){
//            guard nomDocteurTF.hasText else{
//                self.present(alert, animated: true){}
//                return false
//            }
//            guard typeRDV.hasText else{
//                self.present(alert, animated: true){}
//                return false
//            }
//            guard numDocteur.hasText else{
//                self.present(alert, animated: true){}
//                return false
//            }
//        }
//        return true
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueDescriptionRdv {
            let Rdvtemps = segue.destination as! RDVAjoutTempsViewController
                Rdvtemps.medecinSent = self.medecinPasse!
            
        }
        
    }
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return medecins.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return medecins[row].nomMedecin
    }
 
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        medecinPasse = medecins[row]
    }

}
