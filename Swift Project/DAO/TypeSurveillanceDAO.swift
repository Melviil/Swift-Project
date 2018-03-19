//
//  TypeSurveillanceDAO.swift
//  Swift Project
//
//  Created by Melvil on 19/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol TypeSurveillanceDAO {
    func getAll() throws -> [TypeSurveillance]?
    func save(typeSurveillance: TypeSurveillance) throws
    func remove(typeSurveillance: TypeSurveillance) throws
}
