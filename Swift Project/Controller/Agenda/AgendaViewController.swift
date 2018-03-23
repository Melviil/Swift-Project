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
    let array : [String] = ["ddd", "jiji", "fijd", "jiojf", "jiji", "fijd", "jiojf"]
    var arrayMedicament : [Medicament]!
    let medicamentDAO = CoreDataDAOFactory.getInstance().getMedicamentDAO()
    let calendar = Calendar.current
    
    @IBOutlet weak var agendaCollectionView: UICollectionView!

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellMedocCollectionViewCell
        
        cell.nomMedicament.text = array[indexPath.row]
    
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        agendaCollectionView.dataSource = self
        agendaCollectionView.delegate = self
        print("current date : ")
        print(dateToday)
        self.arrayMedicament = self.medicamentDAO.getMedicamentsByDate(date: dateToday)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
