//
//  SuiviPatientViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class SuiviPatientViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    var jours = ["Jour 1","Jour 2","Jour 3","Jour 4","Jour 5"]
    var dateSelected : Int = 0
    
    @IBOutlet weak var tableJour: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableJour.dataSource = self
        tableJour.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBAction func indexChanged(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            dateSelected = 1;
        case 1:
            dateSelected = 2;
        case 2:
            dateSelected = 3;
        case 3:
            dateSelected = 4;
        case 4:
            dateSelected = 5;
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        

        let cell = UITableViewCell()
        cell.textLabel?.text = String(describing: self.jours[indexPath.row])
        return cell
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
