//
//  SurveillanceAjoutViewController.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class SurveillanceAjoutViewController: UIViewController {
    var nomSurveillanceSend = String() // nom sent by segue
    var heureSurveillanceSend = String() // heure sent by segue
    var dateSurveillanceSend = "" // date sent by segue
    override func viewDidLoad() {
        super.viewDidLoad()
        saveNewSurveillance()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func saveNewSurveillance(){ // TODO
        
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
