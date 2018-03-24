//
//  CoreDataDoseMedicamentDAO.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData
class CoreDataDoseMedicamentDAO: DoseMedicamentDAO {
    
    private let entityName: String = "DoseMedicament"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [DoseMedicament]? {
        let request: NSFetchRequest<DoseMedicament> = NSFetchRequest(entityName: self.entityName)
        do {
            let DoseMedicaments: [DoseMedicament] = try CoreDataManager.context.fetch(request)
            return DoseMedicaments
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> DoseMedicament{
        return DoseMedicament(context: self.context)
    }
    func save(doseMedicament: DoseMedicament) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(doseMedicament: DoseMedicament) throws{
        
    }
    func getMedicamentsByDoseName(name : String)  -> [DoseMedicament]? {
        
        let request: NSFetchRequest<DoseMedicament> = NSFetchRequest(entityName:"DoseMedicament")
        request.predicate = NSPredicate(format: "libelleDoseMedicament  == %@", name)
        do {
            let doseMedic: [DoseMedicament] = try CoreDataManager.context.fetch(request)
            return doseMedic
        } catch let error as NSError{
            fatalError("could not get medicaments by date " + error.description)
        }
    }
    func getAllByMedicament(nmedic : TypeMedicament)  -> [DoseMedicament]? {
        
        let request: NSFetchRequest<DoseMedicament> = NSFetchRequest(entityName:"DoseMedicament")
        request.predicate = NSPredicate(format: " contient.libelleTypeMedicament ==%@", nmedic.libelleTypeMedicament!)
        do {
            let doseMedic: [DoseMedicament] = try CoreDataManager.context.fetch(request)
            return doseMedic
        } catch let error as NSError{
            fatalError("could not get medicaments by date " + error.description)
        }
    }
    
    
    
}
