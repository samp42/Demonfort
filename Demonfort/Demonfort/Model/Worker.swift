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
    //of many documents belonging to worker
    var numOfDocs: Int
    
    func getWorker(email: String) -> Void{
        fetchName(email: email){name in self.workerName = name}
        fetchRole(email: email){role in self.workerRole = Role.init(rawValue: role) ?? .worker}
        fetchWorkPlaces(email: email){workPlaces in self.workPlaces = workPlaces}
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
        self.numOfDocs = 0
        
        super.init()
        
        //this line might cause some problems
        //self.getWorker(email: Auth.auth().currentUser!.email!)
        
        //self.worksheets = self.workerRole == .worker ? fetchWorksheets(employee: self.workerName, worksheets: self.worksheets) : fetchWorksheetsWithStatusSent(worksheets: self.worksheets)
        //self.worksheets = sort(dictionary: self.worksheets, ascending: true)
    }
    
    func fetchName(email: String, completion: @escaping (String) -> ()) -> Void {
        
        database.collection(workerCollection).document(email).getDocument() {(querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                //get info about users
                if (querySnapshot != nil && querySnapshot!.exists){
                    let documentData = querySnapshot!.data()!
                    if let nameData = (documentData["Name"] as! String?){
                        DispatchQueue.main.async() {
                            let _ = completion(nameData)
                        }
                    }
                }
            }
        }
    }
    
    func fetchRole(email: String, completion: @escaping (String) -> ()) -> Void {
    
        database.collection(workerCollection).document(email).getDocument() {(querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                //get info about users
                if (querySnapshot != nil && querySnapshot!.exists){
                    let documentData = querySnapshot!.data()!
                    if let roleData = (documentData["Role"] as! String?){
                        DispatchQueue.main.async() {
                            let _ = completion(roleData)
                        }
                    }
                }
            }
        }
    }
    
    func fetchWorkPlaces(email: String, completion: @escaping ([String]) -> ()) -> Void {
        //var workPlaces: [String] = []
        
        database.collection(workerCollection).document(email).getDocument() {(querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                //get info about users
                if (querySnapshot != nil && querySnapshot!.exists){
                    let documentData = querySnapshot!.data()!
                        if let workPlacesData = (documentData["Workplaces"] as! [String]?){
                            DispatchQueue.main.async() {
                                let _ = completion(workPlacesData)
                            }
                        }
                }
            }
        }
    }
        
    //used to fetch data about a specific user
    func fetchEmployee(email: String) -> (name: String, workPlaces: [String], role: Role) {
        var name: String = ""
        var workPlaces: [String] = []
        var role: Role = .worker
        
        database.collection(workerCollection).document(email).getDocument() {(querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                //get info about users
                if (querySnapshot != nil && querySnapshot!.exists){
                    let documentData = querySnapshot!.data()!
                    if let nameData = (documentData["Name"] as! String?){
                        name = nameData
                    }
                    print(name)
                }
            }
        }
        
        database.collection(workerCollection).document(email).getDocument() {(querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                //get info about users
                if (querySnapshot != nil && querySnapshot!.exists){
                    let documentData = querySnapshot!.data()!
                    if let workPlacesData = (documentData["Workplaces"] as! [String]?){
                        workPlaces = workPlacesData
                    }
                    for workPlace in workPlaces{
                        print(workPlace)
                    }
                }
            }
        }
        
        database.collection(workerCollection).document(email).getDocument() {(querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                //get info about users
                if (querySnapshot != nil && querySnapshot!.exists){
                    let documentData = querySnapshot!.data()!
                    if let roleData = (documentData["Role"] as! String?){
                        //role = role.stringToRole(role: roleData)
                        switch(roleData){
                        case "Worker":
                            role = .worker
                        case "Superintendant":
                            role = .superintendent
                        default:
                            role = .worker
                        }
                    }
                    print(role.toString())
                }
            }
        }
        
        return (name, workPlaces, role)
    }
    
    //used to fetch data about all workers
    func fetchWorkers() -> Void{
        database.collection(workerCollection).document().getDocument() {(querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                //get info about users
                
            }
        }
    }
    
    //used by worker to fetch data about own worksheets
    func fetchWorksheetsOfWorker(email: String) -> [String:[String:Any]]{
        //copy of worksheets
        var worksheets : [String:[String:Any]] = ["":["Email":email, "StartTime":"", "EndTime":"", "Status":"", "Description":""]]

        //query
        database.collection(worksheetCollection).whereField("Email", isEqualTo: email).getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    if(querySnapshot != nil){
                        //key = Employee + #
                        for document in querySnapshot!.documents{
                            worksheets.updateValue(document.data(), forKey: "\(document.documentID)")
                        }

                    }

                    //sort documents by time
                        //must sort here
                    for key in worksheets.keys{
                        print(key)
                        self.numOfDocs += 1
                    }
                    if(worksheets.isEmpty){
                        print("Empty")
                    }
                }
        }
        return worksheets
    }
    
    //self explanatory (Used by worker)
    func fetchWorksheetsOfWorkerWithStatusSent(email: String) -> [String:[String:Any]]{
        var worksheets: [String:[String:Any]] = ["":["":""]]
        
        database.collection(worksheetCollection).whereField("Email", isEqualTo: email).whereField("Status", isEqualTo: "Sent").getDocuments(){
            (querySnapshot, error) in
            //
            
        }
        
        return worksheets
    }
    
    //used by *superintendent* to retrieve documents from workers
    func fetchWorksheetsWithStatusSent() -> [String:[String:Any]]{
        //copy of worksheets
        var worksheets: [String:[String:Any]] = ["":["":""]]
        
        //query
        database.collection(worksheetCollection).whereField("Status", isEqualTo: "Envoyée")
            .getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    for document in querySnapshot!.documents {
                        //print("\(document.documentID) => \(document.data())")
                        //store documents in dictionary
                        worksheets.updateValue(document.data(), forKey: "\(document.documentID)")
                    }
                    //sort documents by time
                        //MUST SORT HERE
                    for key in worksheets.keys{
                        print(key)
                        self.numOfDocs += 1
                    }
                    if(worksheets.isEmpty){
                        print("Empty")
                    }
                }
        }
        
        return worksheets
    }
    
    //used to fetch worksheets for this current week(worker)
    func fetchWeeklyWorksheetsOfWorker(email: String) -> [String:[String:Any]]{
        var weeklyWorksheets: [String:[String:Any]] = ["":["":""]]
        return weeklyWorksheets
    }
    
    //used to fetch worksheets for this current week(superintendent)
    func fetchWeeklyWorksheetsForSuperintendent() -> [String:[String:Any]]{
        var weeklyWorksheets: [String:[String:Any]] = ["":["":""]]
        return weeklyWorksheets
    }
    
}
