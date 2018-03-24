//
//  CoreDataRendezVousDAO.swift
//  Swift Project
//
//  Created by Melvil on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataRendezVousDAO: RendezVousDAO {

    
    private let entityName: String = "RendezVous"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    
    func getAll() throws -> [RendezVous]? {
        let request: NSFetchRequest<RendezVous> = NSFetchRequest(entityName: self.entityName)
        do {
            let rendezVouss: [RendezVous] = try CoreDataManager.context.fetch(request)
            return rendezVouss
        } catch let error as NSError {
            throw error
        }
    }
    
    
    func create() -> RendezVous{
        return RendezVous(context: self.context)
    }
    
    func save(rendezVous: RendezVous) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(rendezVous: RendezVous) throws{
        
    }
    
    func getRendezVousByDate(date: Date)  -> [RendezVous]? {
        let calendar = Calendar.current
        let date = calendar.startOfDay(for: date) //On recupere le debut d'aujourd'ui
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute],from: date)
        let dateDebutDelaJourneeEnFr = calendar.date(from: components)!
        print("date debut journée="+dateDebutDelaJourneeEnFr.description)
        
        let request: NSFetchRequest<RendezVous> = NSFetchRequest(entityName: self.entityName)
        //let sort = NSSortDescriptor(key: #keyPath(RendezVous.aPrendreA), ascending: true)
        
        //request.sortDescriptors = [sort]
        request.predicate = NSPredicate(format: "(dateRDV == %@) ", dateDebutDelaJourneeEnFr as CVarArg)
        
        do {
            
            let rendezVous: [RendezVous] = try CoreDataManager.context.fetch(request)
            
            print("RendezVouss")
            print(rendezVous)
            print("dateDebutDelaJourneeEnFr")
            print(dateDebutDelaJourneeEnFr)
            return rendezVous
            
        } catch let error as NSError{
            
            fatalError("could not get RendezVous by date " + error.description)
            
        }
        
    }
    
    func addHeureRendezVous(heure : Heure, rendezVous: RendezVous) throws {
        rendezVous.prisA = heure
        
    }
}
