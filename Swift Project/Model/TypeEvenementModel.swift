//
//  TypeEvenementModel.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//


import Foundation
import CoreData

class TypeEvenementModel {
    
    
    private var dao : TypeEvenement
    
    var libelleTypeEvenement : String {
        get{
            return self.dao.libelleTypeEvenement! ;
        }
        set{
            self.dao.libelleTypeEvenement = newValue;
        }
    } ;
    
    
    
    init(libelleTypeEvenement: String){
        guard let dao = TypeEvenement.getNewTypeEvenementDAO() else {
            fatalError("unable to get DAO for tyepActivite")
        }
        self.dao = dao ;
        self.dao.libelleTypeEvenement = libelleTypeEvenement;
    }
    
}

