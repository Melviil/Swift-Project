//
//  PatientModel.swift
//  Swift Project
//
//  Created by Assil EL YAHYAOUI on 10/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
import CoreData

class PatientModel {
    
    private var dao : Patient
    
    var prenomPatient: String? {
        get{
            return self.dao.prenomPatient ;
        }
        set{
            self.dao.prenomPatient = newValue;
        }
    } ;
    
    
    var  nomPatient: String? {
        get{
            return self.dao.nomPatient ;
        }
        set{
            self.dao.nomPatient = newValue;
        }
    } ;
    
    
    var dateNaissance: Date? {
        get{
            return self.dao.dateNaissance ;
        }
        set{
            self.dao.dateNaissance = newValue;
        }
    } ;
    
    
    
    init(nomPatient: String, prenomPatient: String , dateNaissance: Date ){
        guard let dao = Patient.getNewPatientDAO() else {
            fatalError()
        }
        self.dao = dao ;
        self.dao.prenomPatient = prenomPatient;
        self.dao.nomPatient = nomPatient;
        self.dao.dateNaissance = dateNaissance;
    }

    
    
//    func nomComplet() -> String {
//        return "\(String(describing: self.prenomPatient))" + " " + "\(String(describing: self.prenomPatient))" ;
//    }
    
}
