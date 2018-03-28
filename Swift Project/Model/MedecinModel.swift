//
//  MedecinModel.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class MedecinModel {
   
    private var dao : Medecin
    
    var prenomMedecin: String {
        get{
            return self.dao.prenomMedecin! ;
        }
        set{
            self.dao.prenomMedecin = newValue;
        }
    } ;
    
    
    var  nomMedecin: String {
        get{
            return self.dao.nomMedecin! ;
        }
        set{
            self.dao.nomMedecin = newValue;
        }
    } ;
    
    
    var tel: String {
        get{
            return self.dao.telephoneMedecin! ;
        }
        set{
            self.dao.telephoneMedecin = newValue;
        }
    } ;
    
    
    
    init(prenomMedecin: String, nomMedecin: String , tel: String ){
        guard let dao = Medecin.getNewMedecinDAO() else {
            fatalError("unable to get DAO for MedecinModel")
        }
        self.dao = dao ;
        self.dao.nomMedecin = nomMedecin
        self.dao.prenomMedecin = prenomMedecin
        self.dao.telephoneMedecin = tel
        
    }

    
    
    
//    func nomComplet() -> String {
//        return "\(String(describing: self.nomMedecin))" + " " + "\(String(describing: self.prenomMedecinn))" ;
//    }
    
}
