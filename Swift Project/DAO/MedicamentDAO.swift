//
//  MedicamentDAO.swift
//  Swift Project
//
//  Created by Melvil on 22/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol MedicamentDAO {
    func getAll() throws -> [Medicament]?
    func save(medicament: Medicament) throws
    func remove(medicament: Medicament) throws
    func addHeureMedicament(heure : Heure, medicament: Medicament) throws
}

