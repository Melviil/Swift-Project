//
//  DataHelper.swift
//  Swift Project
//
//  Created by Melvil on 18/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation
public class DataHelper {
    
    static func seedDataStore() {
        seedJour()
        seedTypeSymptome()
        seedTypeSurveillance()
        seedDoseMedicament()
        seedTypeMedicament()


    }
    fileprivate static func seedJour(){
        let jours = JourSeed().jours
        let jourDAO = CoreDataDAOFactory.getInstance().getJourDAO()
        
        for jour in jours {
            let newJour: Jour = jourDAO.create()
            newJour.libelleJour = jour.nom
            newJour.idJour = Int16(jour.id)
            do{
                try jourDAO.save(jour: newJour)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeSymptome(){
        let TypeSymptomes = TypeSymptomeSeed().TypeSymptomes
        let TypeSymptomeDAO = CoreDataDAOFactory.getInstance().getTypeSymptomeDAO()
        for TypeSymptome in TypeSymptomes {
            let newTypeSymptome: TypeSymptome = TypeSymptomeDAO.create()
            newTypeSymptome.libelleTypeSymptome = TypeSymptome.nom
            do{
                try TypeSymptomeDAO.save(typeSymptome: newTypeSymptome)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeSurveillance(){
        let TypeSurveillances = TypeSurveillanceSeed().TypeSurveillances
        let TypeSurveillanceDAO = CoreDataDAOFactory.getInstance().getTypeSurveillanceDAO()
        for TypeSurveillance in TypeSurveillances {
            let newTypeSurveillance: TypeSurveillance = TypeSurveillanceDAO.create()
            newTypeSurveillance.libelleTypeSurveillance = TypeSurveillance.nom
            do{
                try TypeSurveillanceDAO.save(typeSurveillance: newTypeSurveillance)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeMedicament(){
        let TypeMedicaments = TypeMedicamentSeed().TypeMedicaments
        let TypeMedicamentDAO = CoreDataDAOFactory.getInstance().getTypeMedicamentDAO()
        let DoseMedicaments = DoseMedicamentSeed().DoseMedicaments
        let DoseMedicamentDAO = CoreDataDAOFactory.getInstance().getDoseMedicamentDAO()
        for TypeMedicament in TypeMedicaments {
            let newTypeMedicament: TypeMedicament = TypeMedicamentDAO.create()
            newTypeMedicament.libelleTypeMedicament = TypeMedicament.nom
            for doseRecup in TypeMedicament.doses{
                print(doseRecup)
                let dosesss = DoseMedicamentDAO.getMedicamentsByDoseName(name: doseRecup)
                if (dosesss?.count != 0){
                    do{
                        try TypeMedicamentDAO.addDoseTypeMedicament(typeMedicament: newTypeMedicament, dose: (dosesss?[0])!)
                    }catch{
                        fatalError("Error cannot populate DB")
                    }
                }
            }
            do{
                try TypeMedicamentDAO.save(typeMedicament: newTypeMedicament)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedDoseMedicament(){
        let DoseMedicaments = DoseMedicamentSeed().DoseMedicaments
        let DoseMedicamentDAO = CoreDataDAOFactory.getInstance().getDoseMedicamentDAO()
        for DoseMedicament in DoseMedicaments {
            let newDoseMedicament: DoseMedicament = DoseMedicamentDAO.create()
            newDoseMedicament.libelleDoseMedicament = DoseMedicament.nom
            do{
                try DoseMedicamentDAO.save(doseMedicament: newDoseMedicament)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }

}
