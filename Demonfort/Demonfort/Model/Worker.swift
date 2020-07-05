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
    
    func stringToRole(role: String) -> Role{
        if(role=="Superintendent"||role=="superintendent"){
            return .superintendent
        }
        return .worker
    }
    
}

class Worker: SessionStore{
    //worker name
    var workerName: String
    //worker role (superintendent/worker)
    var workerRole: Role
    //worker's workplaces
    var workPlaces: [String]
    //worker's worksheets
    var worksheets: [String:[String:Any]]//[documentName:[key:value]]
    //number of documents is handled by class DatabaseManager
    //woksheets for the week
    var weeklyWorksheets: [String:[String:Any]]//[documentName:[key:value]]
    
    func getWorker(email: String) -> Void{
        self.workerName = fetchWorker(email: email).name
        self.workerRole = fetchWorker(email: email).role
        self.workPlaces = fetchWorker(email: email).workPlaces
        self.worksheets = [:]
        self.weeklyWorksheets = [:]
    }
    
    override init(){
        //first initialisation
        self.workerName = ""
        self.workerRole = .worker
        self.workPlaces = []
        self.worksheets = [:]
        self.weeklyWorksheets = [:]
        super.init()
        //self.worksheets = self.workerRole == .worker ? fetchWorksheets(employee: self.workerName, worksheets: self.worksheets) : fetchWorksheetsWithStatusSent(worksheets: self.worksheets)
        //self.worksheets = sort(dictionary: self.worksheets, ascending: true)
    }
    
}
