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
    var mesSymptomes : [Symptome] = []
    var symptomes : [String] = []

    
    @IBOutlet weak var tableJour: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableJour.dataSource = self
        tableJour.delegate = self
    
        // Do any additional setup after loading the view.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            //Ajouter une error a display
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request  : NSFetchRequest<Symptome> = Symptome.fetchRequest()
        
        do{
            try self.mesSymptomes = context.fetch(request)
        }
        catch{
            return
        }
        
//        for symptome in mesSymptomes{
//            if (symptome. != nil && activite.dateFin != nil){
//
//
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "dd MMMM"
//                dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
//
//                dateFormatter.timeZone = TimeZone.current
//
//                selectedDateDebut = dateFormatter.string(from: activite.dateDebut!)
//
//                selectedDateFin = dateFormatter.string(from: activite.dateFin!)
//                print(selectedDateDebut)
//                print(selectedDateFin)
//                typeActivite = activite.estDeType?.libelleTypeActivite
//                if let heures = activite.sePasseA {
//                    for h in heures{
//                        print("1")
//                        if let heure = h as? Heure{
//                            print("2")
//                            dateFormatter.dateFormat = "HH:mm"
//                            let selectedDate = dateFormatter.string(from: heure.libelleHeure!)
//                            print(selectedDate)
//                            activites.append(  typeActivite! + " du " + selectedDateDebut + " au " + selectedDateFin + " à " + selectedDate)
//
//                        }
//                    }
//                }
//
//            }
//        }
        
    for symptome in mesSymptomes{
        
       let typeSymptome = symptome.aUnType?.libelleTypeSymptome

       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
            
        dateFormatter.timeZone = TimeZone.current
            
         let selectedDate = dateFormatter.string(from: symptome.dateSymptome!)
        
          
         dateFormatter.dateFormat = "HH:mm"
         let selectedHour = dateFormatter.string(from: symptome.heureSymptome!)
         print(selectedDate)
         print(selectedHour)
         symptomes.append( selectedDate + " " + selectedHour + " " + typeSymptome!)

//
//            let dateSymptome = symptome.dateSymptome
//            let heureSymptome = symptome.heureSymptome

        }
        
        
        
    }
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBAction func indexChanged(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            self.dateSelected = 1;
            textfield.text = "-1";
            
        case 1:
            self.dateSelected = 2;
             textfield.text = "-2";
        case 2:
            self.dateSelected = 3;
             textfield.text = "-3";
        case 3:
            self.dateSelected = 4;
             textfield.text = "-4";
        case 4:
            self.dateSelected = 5;
             textfield.text = "-5";
        default:
            self.dateSelected = 1;
             textfield.text = "-1";
        }
        print("dateSelected")
        print(dateSelected)
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
        return symptomes.count
    }
    
    @IBOutlet weak var textfield: UITextField!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let date : Date = getDate()
        print(date)
        
       // self.symptomes = getSymptomeByDay(date) STOPPED HERE 
        
        let cell = UITableViewCell()
        cell.textLabel?.text = String(describing: self.symptomes[indexPath.row])
        return cell
    }
    
//
//    // (Previous code goes here)
//
//    // What will the date and time be be ten days from now?
//    let tenDaysFromNow = userCalendar.dateByAddingUnit(
//        [.Day],
//        value: 10,
//        toDate: NSDate(),
//        options: [])!
//
//    // What weekday (Sunday through Saturday) will it be ten days from now, and
//    // which weekday of the month will it be -- the 1st, 2nd, 3rd...?
//    let weekdayAndWeekdayOrdinal: NSCalendarUnit = [.Weekday, .WeekdayOrdinal]
//    let tenDaysFromNowComponents = userCalendar.components(
//        weekdayAndWeekdayOrdinal,
//        fromDate: tenDaysFromNow)
//    tenDaysFromNowComponents.weekday
//    tenDaysFromNowComponents.weekdayOrdinal
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getDaySelected()-> Int{
        return self.dateSelected
    }
    
    func getDate()-> Date{
//        var dayComp = DateComponents()
//        dayComp.day = 0-(getDaySelected())
//        print("getDateSelected")
//        print(self.dateSelected)
//        print("daycomp: ")
//        print(dayComp)
//        let datetoday = Calendar.current.date(byAdding: dayComp, to: Date()) //fetch current date
//        print("daytoday : ")
//        let dateneeded = Calendar.current.component(.weekday, from: datetoday!) // getdate needed by number selected
//        print("dateneeded : ")
//        print(dateneeded)
//        return dayComp
        let aujo = Date()
        //let calendar = Calendar.current
        let nbjoursavant = self.dateSelected
        print("nbJours")
        print(nbjoursavant)
        let jourVoulu: Date = Calendar.current.date(byAdding: .day, value: 0-nbjoursavant , to : aujo)!
        return jourVoulu
    }

}
