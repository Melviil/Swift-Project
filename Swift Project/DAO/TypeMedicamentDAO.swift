//
//  TypeMedicamentDAO.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol TypeMedicamentDAO {
    func getAll() throws -> [TypeMedicament]?
    func save(typeMedicament: TypeMedicament) throws
    func remove(typeMedicament: TypeMedicament) throws
}

