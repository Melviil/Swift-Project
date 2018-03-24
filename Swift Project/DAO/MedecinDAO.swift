//
//  MedecinDAO.swift
//  Swift Project
//
//  Created by Melvil on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol MedecinDAO {
    func getAll() throws -> [Medecin]?
    func save(medecin: Medecin) throws
    func create() -> Medecin
    func remove(medecin: Medecin) throws
    func getByName(nom : String) throws -> [Medecin]?
}
