//
//  MedecinExtension.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 14/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Medecin {
    static func getNewMedecinDAO() -> Medecin? {
        
    
        guard let entity = NSEntityDescription.entity(forEntityName: "Medecin", in:CoreDataManager.context ) else {
            return nil
        }
        return Medecin(entity: entity, insertInto : CoreDataManager.context)
    }
}

