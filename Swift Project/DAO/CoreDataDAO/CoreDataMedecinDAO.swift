//
//  CoreDataMedecinDAO.swift
//  Swift Project
//
//  Created by Melvil on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreMedecinDAO: MedecinDAO {

    private let entityName: String = "Medecin"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getByName(nom : String) throws -> [Medecin]? {
        let request: NSFetchRequest<Medecin> = NSFetchRequest(entityName: self.entityName)
        request.predicate = NSPredicate(format: "nomMedecin == %@", nom)
        
        do {
            let medecins: [Medecin] = try CoreDataManager.context.fetch(request)
            return medecins
        } catch let error as NSError {
            throw error
        }
    }
    
    func getAll() throws -> [Medecin]? {
        let request: NSFetchRequest<Medecin> = NSFetchRequest(entityName: self.entityName)
        do {
            let medecins: [Medecin] = try CoreDataManager.context.fetch(request)
            return medecins
        } catch let error as NSError {
            throw error
        }
    }
    
    func create() -> Medecin{
        return Medecin(context: self.context)
    }
    
    func save(medecin: Medecin) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(medecin: Medecin) throws{
        
    }
}
