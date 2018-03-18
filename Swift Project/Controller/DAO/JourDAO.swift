//
//  JourDAO.swift
//  Swift Project
//
//  Created by Melvil on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol JourDAO {
    func getAll() throws -> [Jour]?
    func save(jour: Jour) throws
    func remove(jour: Jour) throws
    func getByName(jourParametre : String) throws -> [Jour]?
}

