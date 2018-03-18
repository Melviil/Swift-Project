//
//  HeureDAO.swift
//  Swift Project
//
//  Created by Melvil on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol HeureDAO {
    func getAll() throws -> [Heure]?
    func save(heure: Heure) throws
    func remove(heure: Heure) throws
}

