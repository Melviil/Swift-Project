//
//  SurveillanceDAO.swift
//  Swift Project
//
//  Created by Melvil on 19/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol SurveillanceDAO {
    func getAll() throws -> [Surveillance]?
    func save(surveillance: Surveillance) throws
    func remove(surveillance: Surveillance) throws
    func addTypeSurveillanceASurveillance(surveillance : Surveillance, typeSurveillance: TypeSurveillance) throws
}
