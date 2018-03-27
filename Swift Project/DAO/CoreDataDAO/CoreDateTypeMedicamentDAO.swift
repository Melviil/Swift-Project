//
//  CoreDateTypeMedicamentDAO.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataTypeMedicamentDAO: TypeMedicamentDAO {
   
    private let entityName: String = "TypeMedicament"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [TypeMedicament]? {
        let request: NSFetchRequest<TypeMedicament> = NSFetchRequest(entityName: self.entityName)
        do {
            let TypeMedicaments: [TypeMedicament] = try CoreDataManager.context.fetch(request)
            return TypeMedicaments
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> TypeMedicament{
        return TypeMedicament(context: self.context)
    }
    func save(typeMedicament: TypeMedicament) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(typeMedicament: TypeMedicament) throws{
        
    }
    func addDoseTypeMedicament(typeMedicament : TypeMedicament, dose: DoseMedicament) throws {
        typeMedicament.addToAUneDose(dose)
        
    }
    

    
    
}
