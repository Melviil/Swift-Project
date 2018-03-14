//
//  RendezVousModel.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 14/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class RendezVousModel {
    
    private var dao : RendezVous
    
    var dateRdv: Date? {
        get{
            return self.dao.dateRdv ;
        }
        set{
            self.dao.dateRdv = newValue;
        }
    } ;
    
    
    var  frequence: String? {
        get{
            return self.dao.frequence ;
        }
        set{
            self.dao.frequence = newValue;
        }
    } ;
    
    
    var heureRDV: Date? {
        get{
            return self.dao.heureRDV ;
        }
        set{
            self.dao.heureRDV = newValue;
        }
    } ;
    
    var tpsPourArriver: Date? {
        get{
            return self.dao.tpsPourArriver ;
        }
        set{
            self.dao.tpsPourArriver = newValue;
        }
    } ;
    
    
    
    
    init(dateRdv: Date, frequence: String,heureRDV: Date , tpsPourArriver: Date ){
        guard let dao = RendezVous.getNewRendezVousDAO() else {
            fatalError("Unable to get DAO for frequence RDV")
        }
        self.dao = dao ;
        self.dao.dateRdv = dateRdv;
        self.dao.frequence = frequence;
        self.dao.heureRDV = heureRDV;
        self.dao.tpsPourArriver = tpsPourArriver;
        
        // ajouter le dao du medecin
        
}
}
