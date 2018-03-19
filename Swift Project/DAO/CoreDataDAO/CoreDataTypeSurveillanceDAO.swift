//
//  CoreDataTypeSurveillance.swift
//  Swift Project
//
//  Created by Melvil on 19/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataTypeSurveillanceDAO: TypeSurveillanceDAO {
    
    private let entityName: String = "TypeSurveillance"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [TypeSurveillance]? {
        let request: NSFetchRequest<TypeSurveillance> = NSFetchRequest(entityName: self.entityName)
        do {
            let TypeSurveillances: [TypeSurveillance] = try CoreDataManager.context.fetch(request)
            return TypeSurveillances
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> TypeSurveillance{
        return TypeSurveillance(context: self.context)
    }
    func save(typeSurveillance: TypeSurveillance) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(typeSurveillance: TypeSurveillance) throws{
        
    }
}
