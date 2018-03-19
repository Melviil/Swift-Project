//
//  TypeActiviteExtension.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 14/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//


import Foundation
import UIKit
import CoreData

extension TypeActivite {
    static func getNewTypeActiviteDAO() -> TypeActivite? {
        
        
        guard let entity = NSEntityDescription.entity(forEntityName: "TypeActivite", in: CoreDataManager.context) else {
            return nil
        }
        return TypeActivite(entity: entity, insertInto : CoreDataManager.context)
    }
}


