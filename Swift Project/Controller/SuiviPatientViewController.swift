//
//  SuiviPatientViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class SuiviPatientViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBOutlet weak var tableJour: UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = String(describing: self.activites[indexPath.row])
//        return cell
        var array = ["Jour 1","Jour 2","Jour 3","Jour 4","Jour 5"]
        
        let cell: UITableViewCell! = self.tableJour
            .dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        
        cell.textLabel!.text = array[indexPath.row]
       
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
