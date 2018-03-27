//
//  CoreDataManager.swift
//  Swift Project
//
//  Created by Melvil on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import CoreData
import UIKit

class CoreDataManager : NSObject{
    static var context : NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Application failed")
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    public static func entity(forName name: String) -> NSEntityDescription{
        guard let entity = NSEntityDescription.entity(forEntityName: name, in: self.context) else{
            fatalError()
        }
        return entity
    }
    class func save() throws {
        do {
            try CoreDataManager.context.save()
        } catch let error as NSError {
            throw error
        }
    }
    class func delete(object : NSManagedObject) throws {
        CoreDataManager.context.delete(object)
    }

}

