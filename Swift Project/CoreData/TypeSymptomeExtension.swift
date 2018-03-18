//
//  TypeSymptomeExtension.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 14/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//


import Foundation
import UIKit
import CoreData

extension TypeSymptome{
    static func getNewTypeSymptomeDAO() -> TypeSymptome? {
        
        
        guard let entity = NSEntityDescription.entity(forEntityName: "TypeSymptome", in: CoreDataManager.context) else {
            return nil
        }
        return TypeSymptome(entity: entity, insertInto : CoreDataManager.context)
    }
}




