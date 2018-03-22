//
//  CoreDataMedicamentDAO.swift
//  Swift Project
//
//  Created by Melvil on 22/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataMedicamentDAO: MedicamentDAO {
    
    private let entityName: String = "Medicament"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [Medicament]? {
        let request: NSFetchRequest<Medicament> = NSFetchRequest(entityName: self.entityName)
        do {
            let medicaments: [Medicament] = try CoreDataManager.context.fetch(request)
            return medicaments
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> Medicament{
        return Medicament(context: self.context)
    }
    func save(medicament: Medicament) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(medicament: Medicament) throws{
        
    }
    
    func addHeureMedicament(heure : Heure, medicament: Medicament) throws {
        medicament.addToAPrendreA(heure)
        
    }
}

