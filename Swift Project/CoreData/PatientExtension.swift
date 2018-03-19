//
//  PatientExtension.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 14/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Patient {
    static func getNewPatientDAO() -> Patient? {
        
    
        guard let entity = NSEntityDescription.entity(forEntityName: "Patient", in: CoreDataManager.context) else {
            return nil
        }
        return Patient(entity: entity, insertInto : CoreDataManager.context)
    }    
}


