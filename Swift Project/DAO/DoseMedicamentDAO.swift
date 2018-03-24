//
//  DoseMedicamentDAO.swift
//  Swift Project
//
//  Created by Assil El Yahyaoui on 24/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

protocol DoseMedicamentDAO {
    func getAll() throws -> [DoseMedicament]?
    func save(doseMedicament: DoseMedicament) throws 
    func remove(doseMedicament: DoseMedicament) throws
}
