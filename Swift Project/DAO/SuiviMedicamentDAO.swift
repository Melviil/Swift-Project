//
//  SuiviMedicamentDAO.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 26/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol SuiviMedicamentDAO {
    func getAll() throws -> [SuiviMedicament]?
    func getSuiviMedicamentByDate(date:Date) throws -> [SuiviMedicament]?
    func save(suiviMedicament: SuiviMedicament) throws
    func remove(suiviMedicament: SuiviMedicament) throws
}
