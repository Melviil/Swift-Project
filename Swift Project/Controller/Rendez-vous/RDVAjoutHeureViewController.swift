//
//  RDVAjoutHeureViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 12/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class RDVAjoutHeureViewController: UIViewController {

 
    
    @IBOutlet weak var nomDocteurTF: UITextField!
    @IBOutlet weak var typeRDV: UITextField!
    @IBOutlet weak var numDocteur: UITextField!
    
    @IBAction func rdvRegulier(_ sender: Any) {
    }
    
    
    @IBOutlet weak var ajoutHeureBoutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ajoutHeureBoutton.isEnabled = false ;
        nomDocteurTF.addTarget(self, action: #selector(RDVAjoutHeureViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        typeRDV.addTarget(self, action: #selector(RDVAjoutHeureViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        numDocteur.addTarget(self, action: #selector(RDVAjoutHeureViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func validateInfo(nomdoc : String? , typeRdv : String? , numDoc : String? ) -> Bool {
//        var show = false ;
//
//        if (nomdoc == nil & typeRdv == nil & numDoc == nil) {
//            show = true
//        }
//
//        return show ;
//
//    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let nomDocteur = nomDocteurTF.text, !nomDocteur.isEmpty,
            let typeRDV = typeRDV.text, !typeRDV.isEmpty,
            let numDocteur = numDocteur.text, !numDocteur.isEmpty
            else {
                ajoutHeureBoutton.isEnabled = false
                return
        }
        ajoutHeureBoutton.isEnabled = true
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
