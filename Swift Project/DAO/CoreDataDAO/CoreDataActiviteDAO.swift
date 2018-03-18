//
//  CoreDataActiviteDAO.swift
//  Swift Project
//
//  Created by Melvil on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataActiviteDAO: ActiviteDAO {
    
    private let entityName: String = "Activite"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [Activite]? {
        let request: NSFetchRequest<Activite> = NSFetchRequest(entityName: self.entityName)
        do {
            let activites: [Activite] = try CoreDataManager.context.fetch(request)
            return activites
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> Activite{
        return Activite(context: self.context)
    }
    func save(activite: Activite) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(activite: Activite) throws{
        
    }
    func addJourActivite(jour : Jour, activite: Activite) throws {
        activite.addToSePasseLe(jour)
        
    }
    func addHeureActivite(heure : Heure, activite: Activite) throws {
        activite.addToSePasseA(heure)
        
    }
}
