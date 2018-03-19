//
//  TypeEvenementModel.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 14/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//


import Foundation
import UIKit
import CoreData

extension TypeEvenement {
    static func getNewTypeEvenementDAO() -> TypeEvenement? {
        
        
        guard let entity = NSEntityDescription.entity(forEntityName: "TypeEvenement", in: CoreDataManager.context) else {
            return nil
        }
        return TypeEvenement(entity: entity, insertInto : CoreDataManager.context)
    }
}


