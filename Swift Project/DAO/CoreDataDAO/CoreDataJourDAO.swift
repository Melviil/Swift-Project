//
//  CoreDataJourDAO.swift
//  Swift Project
//
//  Created by Melvil on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataJourDAO: JourDAO {
  
    private let entityName: String = "Jour"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getByName(jourParametre : String) throws -> [Jour]? {
        let request: NSFetchRequest<Jour> = NSFetchRequest(entityName: self.entityName)
        request.predicate = NSPredicate(format: "libelleJour == %@", jourParametre)

        do {
            let jours: [Jour] = try CoreDataManager.context.fetch(request)
            return jours
        } catch let error as NSError {
            throw error
        }
    }
    
    func getAll() throws -> [Jour]? {
        let request: NSFetchRequest<Jour> = NSFetchRequest(entityName: self.entityName)
        do {
            let jours: [Jour] = try CoreDataManager.context.fetch(request)
            return jours
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> Jour{
        return Jour(context: self.context)
    }
    func save(jour: Jour) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(jour: Jour) throws{
        
    }
}
