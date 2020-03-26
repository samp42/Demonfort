//
//  SendErrorManager.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-24.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

class ButtonManager{
    enum ErrorType{
        case incompleteFields //if tasks description is empty
        case dateInverted //if end >= start
        case similarWorksheets //if worksheet exists in database with same date and same workplace
        
        func errorDescription() -> String{
            
            switch(self){
            case .incompleteFields:
                return "Certains champs sont vides."
            case .dateInverted:
                return "Les dates entrées sont invalides."
            case .similarWorksheets:
                return "Il existe une feuille de temps pour cette journée et ce chantier."
            }
        }
    }
    
    func reset() -> Void{
        //reset info from worksheet
    }
    
    func validateErrors() -> [String: Bool]{
        return ["Ehllo":true]
    }
    
    private func fieldsMissing(tasks: String) -> Bool{
        //check that all fields contain something
        guard tasks != "" else{
            return true
        }
        
        return false
    }
}
