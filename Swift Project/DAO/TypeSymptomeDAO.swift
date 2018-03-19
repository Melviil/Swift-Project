//
//  SymptomeDAO.swift
//  Swift Project
//
//  Created by Melvil on 19/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol TypeSymptomeDAO {
    func getAll() throws -> [TypeSymptome]?
    func save(typeSymptome: TypeSymptome) throws
    func remove(typeSymptome: TypeSymptome) throws
}
