//
//  SymptomeModel.swift
//  Swift Project
//
//  Created by Melvil on 20/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class SymptomeModel {
    
    private var dao : Symptome
    

    var dateSymptome: Date? {
        get{
            return self.dao.dateSymptome ;
        }
        set{
            self.dao.dateSymptome = newValue;
        }
    } ;
    
    var heureSymptome: Date? {
        get{
            return self.dao.heureSymptome ;
        }
        set{
            self.dao.heureSymptome = newValue;
        }
    } ;
//
//    var typeSymptome: TypeSymptome? {
//        get{
//            return self.dao.typeSymptome ;
//        }
//        set{
//            self.typeSymptome = newValue;
//            self.dao.typeSymptome = typeSymptomeModel.dao
//        }
//    } ;
//
//
//
    init(dateSymptome: Date, heureSymptome: Date , typesymptome: TypeSymptome ){
        guard let dao = Symptome.getNewSymptomeDAO() else {
            fatalError()
        }
        self.dao = dao ;
        self.dao.dateSymptome = dateSymptome;
        self.dao.heureSymptome = heureSymptome;
//        self.typeSymptome = typeSymptome;
//        self.dao.typeSymptome = typeSymptomeModel.dao
    }
}



//    func nomComplet() -> String {
//        return "\(String(describing: self.prenomPatient))" + " " + "\(String(describing: self.prenomPatient))" ;
//    }

