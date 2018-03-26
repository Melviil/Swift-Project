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
    typealias F = CoreDataTypeSurveillanceDAO
    typealias G = CoreDataSurveillanceDAO
    typealias H = CoreDataMedicamentDAO
    typealias I = CoreDataTypeMedicamentDAO
    typealias J = CoreDataDoseMedicamentDAO

    typealias I = CoreDataRendezVousDAO
    typealias J = CoreMedecinDAO
   
    
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
    func getSurveillanceDAO() -> CoreDataSurveillanceDAO {
        return CoreDataSurveillanceDAO(context: self.context)
    }
    func getTypeSurveillanceDAO() -> CoreDataTypeSurveillanceDAO {
        return CoreDataTypeSurveillanceDAO(context: self.context)
    }
    func getMedicamentDAO() -> CoreDataMedicamentDAO {
        return CoreDataMedicamentDAO(context: self.context)
    }
    func getRendezVousDAO() -> CoreDataRendezVousDAO {
        return CoreDataRendezVousDAO(context: self.context)
    }
    func getMedecinDAO() -> CoreMedecinDAO {
        return CoreMedecinDAO(context: self.context)
    }
    func getTypeMedicamentDAO() -> CoreDataTypeMedicamentDAO {
        return CoreDataTypeMedicamentDAO(context: self.context)
    }
    func getDoseMedicamentDAO() -> CoreDataDoseMedicamentDAO {
        return CoreDataDoseMedicamentDAO(context: self.context)
    }
    
    
    
}
