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
    func getActivitesByDate(date: Date)  -> [Activite]? {
        let calendar = Calendar.current
        let date = calendar.startOfDay(for: date) //On recupere le debut d'aujourd'ui
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute],from: date)
        let dateDebutDelaJourneeEnFr = calendar.date(from: components)!
        let request: NSFetchRequest<Activite> = NSFetchRequest(entityName: self.entityName)
        request.predicate = NSPredicate(format: "(dateDebut <= %@) AND (dateFin >= %@) ", dateDebutDelaJourneeEnFr as CVarArg, dateDebutDelaJourneeEnFr as CVarArg)
        do {
            let activites: [Activite] = try CoreDataManager.context.fetch(request)
            return activites
        } catch let error as NSError{
            fatalError("could not get medicaments by date " + error.description)
        }
    }
    
}
