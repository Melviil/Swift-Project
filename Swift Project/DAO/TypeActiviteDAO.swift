//
//  TypeActiviteDAO.swift
//  Swift Project
//
//  Created by Melvil on 27/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol TypeActiviteDAO {
    func getAll() throws -> [TypeActivite]?
    func save(typeActivite: TypeActivite) throws
    func remove(typeActivite: TypeActivite) throws
}
