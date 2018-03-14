//
//  CoreDataManager.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 14/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager{
    public static let context : NSManagedObjectContext  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public static func entity(forName name: String) -> NSEntityDescription{
        guard let entity = NSEntityDescription.entity(forEntityName: name, in: self.context) else{
            fatalError()
        }
        return entity
    }
}


