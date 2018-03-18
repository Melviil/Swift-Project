//
//  ActiviteDAO.swift
//  Swift Project
//
//  Created by Melvil on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol ActiviteDAO {
    func getAll() throws -> [Activite]?
    func save(activite: Activite) throws
    func remove(activite: Activite) throws
    func addJourActivite(jour : Jour, activite: Activite) throws
    func addHeureActivite(heure : Heure, activite: Activite) throws
}
