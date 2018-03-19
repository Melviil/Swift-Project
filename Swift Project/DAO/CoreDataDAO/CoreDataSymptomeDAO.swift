//
//  CoreDataSymptome.swift
//  Swift Project
//
//  Created by Melvil on 19/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataSymptomeDAO: SymptomeDAO {
private let entityName: String = "Symptome"
private let context: NSManagedObjectContext

init(context:  NSManagedObjectContext){
    self.context = context
}
func getAll() throws -> [Symptome]? {
    let request: NSFetchRequest<Symptome> = NSFetchRequest(entityName: self.entityName)
    do {
        let Symptomes: [Symptome] = try CoreDataManager.context.fetch(request)
        return Symptomes
    } catch let error as NSError {
        throw error
    }
}
func create() -> Symptome{
    return Symptome(context: self.context)
}
func save(symptome: Symptome) throws{
    do{
        try CoreDataManager.save()
    }catch let error as NSError{
        throw error
    }
}
func remove(symptome: Symptome) throws{
    
}
    
    func getSymptomeByDay(date : Date) throws -> [Symptome]? {
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd MMMM"
//        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
//
//        dateFormatter.timeZone = TimeZone.current
//
//        let dateString = dateFormatter.string(from: date)
//        let dateChoisi = dateFormatter.date(from : dateString)!
//
//        let request: NSFetchRequest<Symptome> = NSFetchRequest(entityName: self.entityName)
//        request.predicate = NSPredicate(format: "dateSymptome == %@", dateChoisi as CVarArg)
        
        let request: NSFetchRequest<Symptome> = NSFetchRequest(entityName: self.entityName)
        request.predicate = NSPredicate(format: "dateSymptome == %@", date as CVarArg)
        
        do {
            let symptomes: [Symptome] = try CoreDataManager.context.fetch(request)
            return symptomes
        } catch let error as NSError {
            throw error
        }
    }
    
}
