//
//  CoreDataDAOFactory.swift
//  Swift Project
//
//  Created by Melvil on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class CoreDataDAOFactory: ProtocolDAOFactory{
    typealias A = CoreDataJourDAO
   
    
    private static var instance: CoreDataDAOFactory?
    private let context: NSManagedObjectContext = CoreDataManager.context
    
    private init(){}
    static func getInstance() -> CoreDataDAOFactory{
        guard let instanceFactory = CoreDataDAOFactory.instance else {
            return CoreDataDAOFactory()
        }
        return instanceFactory
    }
    func getJourDAO() -> CoreDataJourDAO {
        return CoreDataJourDAO(context: self.context)
    }
    
}
