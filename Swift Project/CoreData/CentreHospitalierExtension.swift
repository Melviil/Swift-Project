//
//  CentreHospitalierExtension.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 14/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension CentreHospitalier {
    static func getNewCentreHospitalierDAO() -> CentreHospitalier? {
       
        
        guard let entity = NSEntityDescription.entity(forEntityName: "CentreHospitalier", in: CoreDataManager.context) else {
            return nil
        }
        return CentreHospitalier(entity: entity, insertInto : CoreDataManager.context)
    }
}
