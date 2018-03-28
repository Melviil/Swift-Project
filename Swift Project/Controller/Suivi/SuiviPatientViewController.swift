//
//  SuiviPatientViewController.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData

class SuiviPatientViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    var jours = ["Jour 1","Jour 2","Jour 3","Jour 4","Jour 5"]
    var dateSelected : Int = 1
    var mesSymptomes : [Symptome]!
    var symptomes : [String] = []
    let symptomeDAO = CoreDataDAOFactory.getInstance().getSymptomeDAO()
    let calendar = Calendar.current
    
    
    @IBOutlet weak var tableJour: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableJour.dataSource = self
        tableJour.delegate = self
        let date : Date = getDate()
        dateAffichée.text = heureBienAffichee(withDate :date)
        self.mesSymptomes = self.symptomeDAO.getSymptomeByDate(date: date)!
        
    }
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    /**
     permet de changer les valeurs dans la tablebue en fonction de l'index utilisé
     */
    @IBAction func indexChanged(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            self.dateSelected = 1;
            let date : Date = getDate()
            self.mesSymptomes = self.symptomeDAO.getSymptomeByDate(date: date)!
            dateAffichée.text = heureBienAffichee(withDate :date)
            
        case 1:
            self.dateSelected = 2;
            let date : Date = getDate()
            dateAffichée.text = heureBienAffichee(withDate :date)

        case 2:
            self.dateSelected = 3;
            let date : Date = getDate()
            self.mesSymptomes = self.symptomeDAO.getSymptomeByDate(date: date)!
            dateAffichée.text = heureBienAffichee(withDate :date)

        case 3:
            self.dateSelected = 4;
            let date : Date = getDate()
            self.mesSymptomes = self.symptomeDAO.getSymptomeByDate(date: date)!
            dateAffichée.text = heureBienAffichee(withDate :date)

        case 4:
            self.dateSelected = 5;
            let date : Date = getDate()
            self.mesSymptomes = self.symptomeDAO.getSymptomeByDate(date: date)!
            dateAffichée.text = heureBienAffichee(withDate :date)

        default:
            self.dateSelected = 1;
            let date : Date = getDate()
            self.mesSymptomes = self.symptomeDAO.getSymptomeByDate(date: date)!
            dateAffichée.text = heureBienAffichee(withDate :date)

        }
        tableJour.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mesSymptomes.count
    }
    
    @IBOutlet weak var dateAffichée: UILabel!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        if (mesSymptomes.count != 0) && (indexPath.row < mesSymptomes.count){
            let hour = calendar.component(.hour, from: self.mesSymptomes[indexPath.row].heureSymptome!)
            cell.textLabel?.text = String(hour) + "h : " +  String(describing: self.mesSymptomes[indexPath.row].aUnType!.libelleTypeSymptome!)
        }
        else{
            print("table view : Index out of range=" + String(indexPath.row))
        }
        return cell
    }

  
    //Retourne la date moins le nombre de jour voulu
    func getDate()-> Date{
        //retourne le jours voulu en fonction du picker

        let aujo = Date()
        let nbjoursavant = self.dateSelected
        print("nbJours")
        print(nbjoursavant)
        let jourVoulu: Date = Calendar.current.date(byAdding: .day, value: 0-nbjoursavant , to : aujo)!
        return jourVoulu
    }
    // Retourne la date en Francais bien affichée
    func heureBienAffichee(withDate dateRecupere: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyy "
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        
        dateFormatter.timeZone = TimeZone.current
        
        let selectedDate = dateFormatter.string(from: dateRecupere)
        return selectedDate
    }
    
    

}
