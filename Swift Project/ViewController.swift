//
//  ViewController.swift
//  Swift Project
//
//  Created by Melvil on 17/02/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    

    @IBOutlet weak var ContactButton: UIButton!
    
    @IBAction func ahah(_ sender: Any) {
    
        let alert = UIAlertController( title : " Nouveau type d'activité", message : "Ajouter un type d'activité", preferredStyle : .alert)
        
        let saveAction = UIAlertAction ( title :"Ajouter", style : .default )
        {
            [unowned self ] action in
            guard let textField = alert.textFields?.first,
                let typeActivityToSave = textField.text else {
                    return
            }
            self.saveNewTypeActivity(withName : typeActivityToSave)
        }
        
        let cancelAction = UIAlertAction ( title  : "Annuler", style : .default)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert , animated : true)
    }
    
    func saveNewTypeActivity( withName typeActivityToSave : String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
          //  self.alertError(errorMsg: " Could not save type ", userInfo : "Unknown reason" )
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let type = TypeActivite(context : context)
        type.libelleTypeActivite = typeActivityToSave
        do{
            try context.save()
        }
        catch  {
            //  self.alertError(errorMsg: " Could not save type ", userInfo : "Unknown reason" )
            return 
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}

