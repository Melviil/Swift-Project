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
    func getMedicamentsByDate(date: Date)  -> [Medicament]? {
        let calendar = Calendar.current
        let date = calendar.startOfDay(for: date) //On recupere le debut d'aujourd'ui
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute],from: date)
        let dateDebutDelaJourneeEnFr = calendar.date(from: components)!
        let request: NSFetchRequest<Medicament> = NSFetchRequest(entityName: self.entityName)
        request.predicate = NSPredicate(format: "(dateDebutMedicament <= %@) AND (dateFinMedicament >= %@) ", dateDebutDelaJourneeEnFr as CVarArg, dateDebutDelaJourneeEnFr as CVarArg)
        do {
            let medicaments: [Medicament] = try CoreDataManager.context.fetch(request)
            return medicaments
        } catch let error as NSError{
            fatalError("could not get medicaments by date " + error.description)
        }
    }
    
    func addHeureMedicament(heure : Heure, medicament: Medicament) throws {
        medicament.addToAPrendreA(heure)
    }
    func addTypeMedicament(typeMedicament : TypeMedicament, medicament: Medicament) throws {
        medicament.a = typeMedicament
    }
    func addDoseMedicament(doseMedicament : DoseMedicament, medicament: Medicament) throws {
        medicament.aUneDose = doseMedicament
    }

}

