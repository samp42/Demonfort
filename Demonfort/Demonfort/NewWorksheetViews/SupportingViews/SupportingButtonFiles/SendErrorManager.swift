//
//  SendErrorManager.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-24.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

class ButtonManager{
   
    var employee: String
    var workPlaces: [String]
    
    init(employee: String, workPlaces: [String]){
        self.employee = employee
        self.workPlaces = workPlaces
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
