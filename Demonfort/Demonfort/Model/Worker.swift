//
//  Worker.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-04-22.
//  Copyright © 2020 Demonfort. All rights reserved.
//

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
    
    func toStringFrench() -> String{
        switch self {
        case .superintendent:
            return "Superintendant"
        case .worker:
            return "Ouvrier"
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
    var worksheets: [String:[String:Any]]//[documentName:[key:value]]
    //number of documents
    var numOfDocuments: Int8
    
    override init(){
        self.workerName = "Samuel Proulx"
        self.workerRole = .worker
        self.workPlaces = ["123 rue Maisonneuve, Montréal", "456 rue Waverly, Montréal"]
        self.workerStatusWeekly = []
        self.worksheets = [:]
        self.numOfDocuments = 0
        super.init()
        self.worksheets = fetchWorksheets(employee: self.workerName, worksheets: self.worksheets)
    }
    
    func getNumOfDocuments(){
        self.numOfDocuments = Int8(self.worksheets.keys.count)
        print(self.numOfDocuments)
    }
    
}
