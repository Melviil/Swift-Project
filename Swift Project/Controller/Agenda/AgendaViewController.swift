//
//  AgendaViewController.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 22/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit
import CoreData


class AgendaViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var numberOfCells = Int()
    let dateToday = Date()
    var arrayMedicament : [Medicament]!
    var arrayActivite : [Activite]!
    var arrayAllString = [[String]]()
    let medicamentDAO = CoreDataDAOFactory.getInstance().getMedicamentDAO()
    let activiteDAO = CoreDataDAOFactory.getInstance().getActiviteDAO()

    let calendar = Calendar.current
    
    
    
    
    @IBOutlet weak var agendaCollectionView: UICollectionView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayAllString.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cellMedoc = collectionView.dequeueReusableCell(withReuseIdentifier: "cellMed", for: indexPath) as! CellMedocCollectionViewCell
        let cellAct = collectionView.dequeueReusableCell(withReuseIdentifier: "cellAct", for: indexPath) as! CellActiviteCollectionViewCell
        print(indexPath)
        if ((arrayAllString.count != 0) && (indexPath.row < arrayAllString.count)){
            print("lalalalla")
            print(arrayAllString)
            if (  arrayAllString[indexPath.row][0] == "medicament"){
                cellMedoc.doseMedicamentLabel.text = arrayAllString[indexPath.row][3]
                cellMedoc.nomMedicament.text = arrayAllString[indexPath.row][1]
                cellMedoc.heurePriseMedicamentLabel.text = arrayAllString[indexPath.row][2]
                return cellMedoc
            }

            if (  arrayAllString[indexPath.row][0] == "activite"){
                cellAct.nomActivite.text = arrayAllString[indexPath.row][1]
                cellAct.heureActiviteLabel.text = arrayAllString[indexPath.row][2]
             
                return cellAct
            }
        }
            return cellAct
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        agendaCollectionView.dataSource = self
        agendaCollectionView.delegate = self
        
        ajoutDesMedicamentsDansMatrice()
        ajoutDesActivitesDansMatrice()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        arrayAllString = arrayAllString.sorted(by: { dateFormatter.date(from:$0[2])?.compare(dateFormatter.date(from:$1[2])!) == .orderedAscending })

        
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func ajoutDesMedicamentsDansMatrice(){
        let dateFormatter = DateFormatter() // TODO : factoriser le dateFormatter
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        dateFormatter.timeZone = TimeZone.current
        self.arrayMedicament = self.medicamentDAO.getMedicamentsByDate(date: dateToday)
        for medicament in arrayMedicament{
            let heuresM : [Heure] = medicament.aPrendreA?.allObjects as! [Heure]
            for h in heuresM{
                let dose =  medicament.doseMedicament!
                let nom = medicament.nomMedicament!
                let heure = dateFormatter.string(from: h.libelleHeure!)
                arrayAllString.append(["medicament",nom,String(describing: heure),dose])
            }
        }
    }
    func ajoutDesActivitesDansMatrice(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        dateFormatter.timeZone = TimeZone.current
        self.arrayActivite = self.activiteDAO.getActivitesByDate(date: dateToday)
        for activite in arrayActivite{
            let heuresM : [Heure] = activite.sePasseA!.allObjects as! [Heure]
            for h in heuresM{
                let nom = activite.estDeType?.libelleTypeActivite!
                let heure = dateFormatter.string(from: h.libelleHeure!)
                arrayAllString.append(["activite",nom!,String(describing: heure)])
            }
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
