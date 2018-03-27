////
////  SupprimerTypeActiviteViewController.swift
////  Swift Project
////
////  Created by Assil El Yahyaoui on 27/03/2018.
////  Copyright © 2018 Melvil. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//class SupprimerTypeActiviteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return
//    }
//
//
////    override func didReceiveMemoryWarning() {
////        super.didReceiveMemoryWarning()
////        // Dispose of any resources that can be recreated.
////    }
////
////
////    @IBOutlet weak var listeActiviteTV: UITableView!
////
////
////    var typeActiviteString: [String] = []
////    var typeActivites: [Medecin] = []
////    var nomTypeActivite : String?
////
////
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        listeActiviteTV.dataSource = self
////        listeActiviteTV.delegate = self
////
////        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
////            //Ajouter une error a display
////            return
////        }
////        let context = appDelegate.persistentContainer.viewContext
////        let request : NSFetchRequest<TypeActivite> = TypeActivite.fetchRequest()
////
////        do{
////            try self.typeActivites = context.fetch(request)
////        }
////        catch{
////            return
////        }
////
////        for m in contacts{
////
////            nomMedecin = m.nomMedecin
////            numMedecin = m.telephoneMedecin
////
////            contactsString.append("DR " + nomMedecin! + " tel : " + numMedecin!)
////        }
////    }
////
////    override func didReceiveMemoryWarning() {
////        super.didReceiveMemoryWarning()
////        // Dispose of any resources that can be recreated.
////    }
////
////
////    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
////        return 1
////    }
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return contacts.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////
////        let cell = UITableViewCell()
////        cell.textLabel?.text = String(describing: self.contactsString[indexPath.row])
////        return cell
////
////    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}

