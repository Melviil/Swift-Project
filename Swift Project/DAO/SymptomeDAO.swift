//
//  SymptomeDAO.swift
//  Swift Project
//
//  Created by Melvil on 19/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol SymptomeDAO {
    func getAll() throws -> [Symptome]?
    func getSymptomeByDate(date:Date) throws -> [Symptome]?
    func save(symptome: Symptome) throws
    func remove(symptome: Symptome) throws
}
