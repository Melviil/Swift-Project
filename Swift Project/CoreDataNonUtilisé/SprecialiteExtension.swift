//
//  SprecialiteExtension.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 14/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation

import UIKit
import CoreData

extension Specialite {
    static func getNewSpecialiteDAO() -> Specialite? {
        
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Specialite", in: CoreDataManager.context) else {
            return nil
        }
        return Specialite(entity: entity, insertInto : CoreDataManager.context)
    }
}


