//
//  RendezVousExtension.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 14/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//


import Foundation
import UIKit
import CoreData

extension RendezVous {
    static func getNewRendezVousDAO() -> RendezVous? {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "RendezVous", in: CoreDataManager.context) else {
            return nil
        }
        return RendezVous(entity: entity, insertInto : CoreDataManager.context)
    }
}

