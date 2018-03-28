//
//  TypeSymptomeModel.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class TypeSymptomeModel {
    
    
    private var dao : TypeSymptome
    
    var libelleTypeSymptome : String {
        get{
            return self.dao.libelleTypeSymptome! ;
        }
        set{
            self.dao.libelleTypeSymptome = newValue;
        }
    } ;
    
    
    
    init(libelleTypeSymptome: String){
        guard let dao = TypeSymptome.getNewTypeSymptomeDAO() else {
            fatalError("unable to get DAO for TypeSymptome")
        }
        self.dao = dao ;
        self.dao.libelleTypeSymptome = libelleTypeSymptome;
    }
    
}

