//
//  SpecialiteModel.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class SpecialiteModel {
    
    private var dao : Specialite
    
    var libelleSpecialite: String? {
        get{
            return self.dao.libelleSpecialite ;
        }
        set{
            self.dao.libelleSpecialite = newValue;
        }
    } ;
    
  
    
    
    init(libelleSpecialite: String){
        guard let dao = Specialite.getNewSpecialiteDAO() else {
            fatalError("Cannot get dao for class specialite")
        }
        self.dao = dao ;
        self.dao.libelleSpecialite = libelleSpecialite;
       

    }
    
}
