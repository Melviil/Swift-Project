//
//  CoreDataSuiviMedicamentDAO.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 26/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreSuiviMedicamentDAO: SuiviMedicamentDAO {

    private let entityName: String = "SuiviMedicament"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [SuiviMedicament]? {
        let request: NSFetchRequest<SuiviMedicament> = NSFetchRequest(entityName: self.entityName)
        do {
            let SuiviMedicaments: [SuiviMedicament] = try CoreDataManager.context.fetch(request)
            return SuiviMedicaments
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> SuiviMedicament{
        return SuiviMedicament(context: self.context)
    }
    func save(suiviMedicament: SuiviMedicament) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(suiviMedicament: SuiviMedicament) throws{
        
    }
    
    func getSuiviMedicamentByDate(date: Date)  -> [SuiviMedicament]? {
        
        let calendar = Calendar.current
        let date = calendar.startOfDay(for: date) //On recupere le debut d'aujourd'ui
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute],from: date)
        let dateDebutDelaJourneeEnFr = calendar.date(from: components)!
        print("date debut journée="+dateDebutDelaJourneeEnFr.description)

        
        let request: NSFetchRequest<SuiviMedicament> = NSFetchRequest(entityName: self.entityName)
        let sort = NSSortDescriptor(key: #keyPath(SuiviMedicament.dateSuiviMedicament), ascending: true)
        request.sortDescriptors = [sort]
        
        request.predicate = NSPredicate(format: "(dateSymptome == %@)", dateDebutDelaJourneeEnFr as CVarArg)
        
        
        do {
            let suiviMedicaments: [SuiviMedicament] = try CoreDataManager.context.fetch(request)
             return suiviMedicaments
            
        } catch let error as NSError{
            fatalError("could not get symptome by date " + error.description)
        }
    }
    
}
