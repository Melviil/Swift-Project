//
//  AgendaViewController.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 22/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import UIKit

class CollectionAgendaViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var numberOfcells : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
   func collectionView(_ collectionView: UICollectionView, cellforItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
    var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for : indexPath as IndexPath) as UICollectionViewCell
    
    return cell
    }
    
}
