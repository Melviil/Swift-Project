//
//  RdvDAO.swift
//  Swift Project
//
//  Created by Melvil on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol RendezVousDAO {
    func getAll() throws -> [RendezVous]?
    func getRendezVousByDate(date:Date) throws -> [RendezVous]?
    func save(rendezVous: RendezVous) throws
    func remove(rendezVous: RendezVous) throws
}

