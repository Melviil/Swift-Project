//
//  PatientModel.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 10/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

extension Patient {
    
    func nomComplet() -> String {
        return prenom + " " + nom
        
    }
    
}
