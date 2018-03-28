//
//  TypeActiviteModel.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class TypeActiviteModel {
    

private var dao : TypeActivite

    var libelleTypeActivite : String {
        get{
            return self.dao.libelleTypeActivite! ;
        }
        set{
            self.dao.libelleTypeActivite = newValue;
        }
    } ;



    init(libelleTypeActivite: String){
        guard let dao = TypeActivite.getNewTypeActiviteDAO() else {
            fatalError("unable to get DAO for tyepActivite")
        }
        self.dao = dao ;
        self.dao.libelleTypeActivite = libelleTypeActivite;
    }

}
