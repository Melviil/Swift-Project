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
    var arrayRdvs : [RendezVous]!
    var arrayAllString = [[String]]()
    var arrayAny = [[Any]]()
    
    var indexArrayMed = 0
    var indexArrayActivite = 0
    var indexArrayRdv = 0
    
    let medicamentDAO = CoreDataDAOFactory.getInstance().getMedicamentDAO()
    let activiteDAO = CoreDataDAOFactory.getInstance().getActiviteDAO()
    let rendezvousDAO = CoreDataDAOFactory.getInstance().getRendezVousDAO()
    
    var medicamentpasse : Medicament!

    let medicamentDescriptionSegue = "medicamentDescriptionSegue"
    let calendar = Calendar.current
    
    
    
    
    @IBOutlet weak var agendaCollectionView: UICollectionView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayAllString.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cellMedoc = collectionView.dequeueReusableCell(withReuseIdentifier: "cellMed", for: indexPath) as! CellMedocCollectionViewCell
        let cellAct = collectionView.dequeueReusableCell(withReuseIdentifier: "cellAct", for: indexPath) as! CellActiviteCollectionViewCell
         let cellRdv = collectionView.dequeueReusableCell(withReuseIdentifier: "cellRdv", for: indexPath) as! CellRdvCollectionViewCell
        
        if ((arrayAllString.count != 0) && (indexPath.row < arrayAllString.count)){

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
            if (  arrayAllString[indexPath.row][0] == "rendezvous"){
                cellRdv.heureRdvLabel.text = arrayAllString[indexPath.row][2]
                cellRdv.NomMedecinRdvLabel.text = ( "DR " + arrayAllString[indexPath.row][1])
                cellRdv.nomRdv.text = arrayAllString[indexPath.row][3]
                return cellRdv
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
        ajoutRdvDansMatrice()
        let dateFormatter = DateFormatter()
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
                let dose =  medicament.aUneDose?.libelleDoseMedicament!
                let nom = medicament.a?.libelleTypeMedicament!
                let heure = dateFormatter.string(from: h.libelleHeure!)
                arrayAllString.append(["medicament",nom!,String(describing: heure),dose!, String(indexArrayMed)])
                indexArrayMed = indexArrayMed + 1
                
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
                arrayAllString.append(["activite",nom!,String(describing: heure), String(indexArrayActivite)])
                indexArrayActivite = indexArrayActivite + 1
            }
        }
    }
    func ajoutRdvDansMatrice(){
        let heureFormatter = DateFormatter()
        heureFormatter.dateFormat = "HH:mm"
        heureFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        heureFormatter.timeZone = TimeZone.current

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        dateFormatter.timeZone = TimeZone.current

        self.arrayRdvs = self.rendezvousDAO.getRendezVousByDate(date: dateToday)
        for rdv in arrayRdvs{
         
                let nomMed = rdv.avec?.nomMedecin
                let heure = heureFormatter.string(from: rdv.heureRDV!)
                let temps = heureFormatter.string(from: rdv.tpsPourArriver!)
                let spéMedecin = rdv.avec?.titreMedecin
            arrayAllString.append(["rendezvous",nomMed!,String(describing: heure),spéMedecin!,temps, String(indexArrayRdv)])
                indexArrayRdv = indexArrayRdv + 1
       
            
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

//        if arrayAllString[indexPath.row][0] == "medicament" {

//        }
        if (  arrayAllString[indexPath.row][0] == "medicament"){
          let idmedicamentpasse = arrayAllString[indexPath.row][4]
           self.medicamentpasse = arrayMedicament[0]
            performSegue(withIdentifier: self.medicamentDescriptionSegue, sender: self)
        }


    }
    
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == self.medicamentDescriptionSegue {
            let medDesc = segue.destination as! ResumeMedicamentViewController
            medDesc.medicament = self.medicamentpasse
        }
    }

}
