//
//  CoreDataSymptomeDAO.swift
//  Swift Project
//
//  Created by Melvil on 19/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataTypeSymptomeDAO: TypeSymptomeDAO {
    
    private let entityName: String = "TypeSymptome"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [TypeSymptome]? {
        let request: NSFetchRequest<TypeSymptome> = NSFetchRequest(entityName: self.entityName)
        do {
            let TypeSymptomes: [TypeSymptome] = try CoreDataManager.context.fetch(request)
            return TypeSymptomes
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> TypeSymptome{
        return TypeSymptome(context: self.context)
    }
    func save(typeSymptome: TypeSymptome) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(typeSymptome: TypeSymptome) throws{
        
    }


}
