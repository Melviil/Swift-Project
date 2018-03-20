//
//  SymptomeExtension.swift
//  Swift Project
//
//  Created by Melvil on 20/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Symptome {
    static func getNewSymptomeDAO() -> Symptome? {
        
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Symptome", in: CoreDataManager.context) else {
            return nil
        }
        return Symptome(entity: entity, insertInto : CoreDataManager.context)
    }
}
