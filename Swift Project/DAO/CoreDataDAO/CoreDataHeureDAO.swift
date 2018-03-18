//
//  CoreDataHeureDAO.swift
//  Swift Project
//
//  Created by Melvil on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHeureDAO: HeureDAO {
    
    private let entityName: String = "Heure"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [Heure]? {
        let request: NSFetchRequest<Heure> = NSFetchRequest(entityName: self.entityName)
        do {
            let heures: [Heure] = try CoreDataManager.context.fetch(request)
            return heures
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> Heure{
        return Heure(context: self.context)
    }
    func save(heure: Heure) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(heure: Heure) throws{
        
    }
}
