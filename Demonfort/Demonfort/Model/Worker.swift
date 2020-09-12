//
//  Worker.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-04-22.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import Firebase
import FirebaseFirestore

enum Role: String{
    case superintendent = "Superintendant", worker = "Worker"
    
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
        fetchName(email: email){name in self.workerName = name}
        fetchRole(email: email){role in self.workerRole = Role.init(rawValue: role)!}
        self.workPlaces = fetchWorkPlaces(email: email)
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
        
        //this line might cause some problems
        //self.getWorker(email: Auth.auth().currentUser!.email!)
        
        //self.worksheets = self.workerRole == .worker ? fetchWorksheets(employee: self.workerName, worksheets: self.worksheets) : fetchWorksheetsWithStatusSent(worksheets: self.worksheets)
        //self.worksheets = sort(dictionary: self.worksheets, ascending: true)
    }
    
}
