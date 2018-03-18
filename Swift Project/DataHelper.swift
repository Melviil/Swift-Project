//
//  DataHelper.swift
//  Swift Project
//
//  Created by Melvil on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
public class DataHelper {
    
    static func seedDataStore() {
        seedJour()
    }
    fileprivate static func seedJour(){
        let jours = JourSeed().jours
        let jourDAO = CoreDataDAOFactory.getInstance().getJourDAO()
        
        for jour in jours {
            let newJour: Jour = jourDAO.create()
            newJour.libelleJour = jour.nom
            newJour.idJour = Int16(jour.id)
            do{
                try jourDAO.save(jour: newJour)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
}
}
