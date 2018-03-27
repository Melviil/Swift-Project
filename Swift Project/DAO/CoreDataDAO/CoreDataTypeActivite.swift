//
//  CoreDataTypeActivite.swift
//  Swift Project
//
//  Created by Melvil on 27/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataTypeActiviteDAO: TypeActiviteDAO {
    
    private let entityName: String = "TypeActivite"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [TypeActivite]? {
        let request: NSFetchRequest<TypeActivite> = NSFetchRequest(entityName: self.entityName)
        do {
            let TypeActivites: [TypeActivite] = try CoreDataManager.context.fetch(request)
            return TypeActivites
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> TypeActivite{
        return TypeActivite(context: self.context)
    }
    func save(typeActivite: TypeActivite) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(typeActivite: TypeActivite) throws{
        
    }
    
    
}
