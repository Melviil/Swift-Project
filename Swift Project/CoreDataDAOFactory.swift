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
    typealias B = CoreDataActiviteDAO
    typealias C = CoreDataHeureDAO
    typealias D = CoreDataTypeSymptomeDAO
    typealias E = CoreDataSymptomeDAO

   
    
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
    func getActiviteDAO() -> CoreDataActiviteDAO {
        return CoreDataActiviteDAO(context: self.context)
    }
    func getHeureDAO() -> CoreDataHeureDAO {
        return CoreDataHeureDAO(context: self.context)
    }
    func getTypeSymptomeDAO() -> CoreDataTypeSymptomeDAO {
        return CoreDataTypeSymptomeDAO(context: self.context)
    }
    func getSymptomeDAO() -> CoreDataSymptomeDAO {
        return CoreDataSymptomeDAO(context: self.context)
    }
    
}
