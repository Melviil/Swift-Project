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

extension TypeSurveillance {
    static func getNewTypeEvenementDAO() -> TypeSurveillance? {
        
        
        guard let entity = NSEntityDescription.entity(forEntityName: "TypeEvenement", in: CoreDataManager.context) else {
            return nil
        }
        return TypeSurveillance(entity: entity, insertInto : CoreDataManager.context)
    }
}


