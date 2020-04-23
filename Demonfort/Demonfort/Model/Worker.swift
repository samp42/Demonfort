//
//  Worker.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-04-22.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

enum Role{
    case superintendent, worker
    
    func toString() -> String{
        switch self {
        case .superintendent:
            return "Superintendent"
        case .worker:
            return "Worker"
        }
    }
    
}

class Worker: DatabaseManager, ObservableObject{
    //worker name
    let workerName: String
    //worker role (superintendent/worker)
    let workerRole: Role
    //worker status
    var workerStatusWeekly: [Status]
    //worker's workplaces
    var workPlaces: [String]
    //worker's worksheets
    
    
    override init(){
        self.workerName = ""
        self.workerRole = .worker
        self.workPlaces = ["123 rue Maisonneuve, Montréal", "456 rue Waverly, Montréal"]
        self.workerStatusWeekly = []
        //for i in 0..<1{
            self.workerStatusWeekly.append(.notSent)
            print(self.workerStatusWeekly[0].rawValue)
        //}
    }
}
