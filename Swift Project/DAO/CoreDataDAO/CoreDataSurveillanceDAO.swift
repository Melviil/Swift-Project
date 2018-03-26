//
//  CoreDataSurveillanceDAO.swift
//  Swift Project
//
//  Created by Melvil on 19/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataSurveillanceDAO: SurveillanceDAO {
    
    private let entityName: String = "Surveillance"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    
    func getAll() throws -> [Surveillance]? {
        let request: NSFetchRequest<Surveillance> = NSFetchRequest(entityName: self.entityName)
        do {
            let Surveillance: [Surveillance] = try CoreDataManager.context.fetch(request)
            return Surveillance
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> Surveillance{
        return Surveillance(context: self.context)
    }
    

    func save(surveillance: Surveillance) throws{
        do{
            print("coredata avant save ")
            try CoreDataManager.save()
            print("cd apres save")

        }catch let error as NSError{
            throw error
        }
    }
    func remove(surveillance: Surveillance) throws{
        
    }
    
    func addTypeSurveillanceASurveillance(surveillance : Surveillance, typeSurveillance: TypeSurveillance) throws {
        surveillance.aUnTypeSurveillance = typeSurveillance
        
    }
}
