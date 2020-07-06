//
//  DatabaseManager.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-04-22.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

/*
 1. fetchName(email: String) -> String >>> takes current user's email and gets its name
        Status: Ok
 2. fetchRole(email: String) -> Role >>> takes current user's email and gets its role
        Status: Ok
 3. fetchWorkPlaces(email: String) -> [String] >>> takes current user's email and gets its work places
        Status: Ok
 4. fetchEmployee(email: String) -> (name: String, workPlaces: [String], role: Role) >>> takes current user's email and gets its name, workPlaces and role
        Status: Ok
 5. fetchWorkers() -> Void >>>                      ?????????????
        Status: IDK WTF is going on
 6. fetchWorksheetsOfWorker(email: String) -> [String:[String:Any]] >>> takes current user's email and gets all its worksheets
        Status: Errors
 7. fetchWorksheetsOfWorkerWithStatusSent(email: String, worksheets: [String:[String:Any]]) -> [String:[String:Any]] >>> takes current user's email and worksheets and gets all its worksheets that have status 'sent'
        Status: TBD
 8. fetchWorksheetsWithStatusSent() -> [String:[String:Any]] >>> takes all worksheets from database and updates it in app for superintendant
        **SUPERINTENDANT ONLY**
        Status: TBD
 9. fetchWeeklyWorksheetsOfWorker(email: String) -> [String:[String:Any]] >>> takes email of current user's and gets all worksheets from the current week
        Status: TBD
 10. fetchWorksheetsWithStatusSent() -> [String:[String:Any]] >>>
        Status: TBD
 11. fetchWeeklyWorksheetsForSuperintendent() -> [String:[String:Any]] >>> gets all worksheets of all workers from the current week
        **SUPERINTENDANT ONLY**
        Status: TBD
 12. sendUserName(email: String, employee: String) -> Void >>> takes current user's email and name and creates or updates document about user's info and places or updates name into it
        Status: OK
 13. sendUserEmail(email: String) -> Void >>> takes current user's email and creates or updates document about user's info
        Status: OK
 14. sendUserWorkPlaces(email: String, workPlaces: [String]) -> Void >>> takes current user's email and work places and creates or updates document about user's info and places or updates work places into it
        Status: OK
 15. sendUserRole(email: String, role: Role, allowed: Bool) -> Void >>> takes current user's email and role and a superintendant's permission to update the user's role
        Status: TBD
 16. sendWorksheet(employee: String, start: Date, end: Date, status: Status, tasks: String) -> Void >>> takes fields of worksheet and creates new document about worksheet in database
        Status: OK
 17. correctWorksheet() -> Void >>> sends back worksheet to be validated..                    ???????????????????? HELP PLZ
        **SUPERINTENDANT ONLY**
        Status: TBD
 18. validateWorksheet(start: Date, end: Date, tasks: String) -> Error? >>> takes start and end times with tasks entered and verify that inputs are valids
        Status: OK
 */

class DatabaseManager{
    let database = Firestore.firestore()
    let workerCollection = "workers" //documentID: name, document.data: Role
    //future:
        //let workPlacesCollection = "workPlaces" //documentID: address
    let worksheetCollection = "worksheets" //documentID: employee+sheet number, document.data: start, end, workplace, status, tasks
    var numOfDocs: Int = 0
    
    public func fetchName(email: String) -> String {
        var name: String = ""
    
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
        return name
    }
    
    public func fetchRole(email: String) -> Role {
        var role: Role = .worker
    
        database.collection(workerCollection).document(email).getDocument() {(querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                //get info about users
                if (querySnapshot != nil && querySnapshot!.exists){
                    let documentData = querySnapshot!.data()!
                    if let roleData = (documentData["Role"] as! String?){
                        role = role.stringToRole(role: roleData)
                    }
                    print(role.toString())
                }
            }
        }
        
        return role
    }
    
    public func fetchWorkPlaces(email: String) -> [String] {
        var workPlaces: [String] = []
    
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
        
        return workPlaces
    }
        
    //used to fetch data about a specific user
    public func fetchEmployee(email: String) -> (name: String, workPlaces: [String], role: Role) {
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
                        role = role.stringToRole(role: roleData)
                    }
                    print(role.toString())
                }
            }
        }
        
        return (name, workPlaces, role)
    }
    
    //used to fetch data about all workers
    public func fetchWorkers() -> Void{
        database.collection(workerCollection).document().getDocument() {(querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                //get info about users
                
            }
        }
    }
    
    //used by worker to fetch data about own worksheets
//    func fetchWorksheetsOfWorker(email: String, worksheets: [String:[String:Any]]) -> [String:[String:Any]]{
//        //copy of worksheets
//        var worksheets : [String:[String:Any]] = [:["Email":email, "StartTime":, "EndTime":, "Status":, "Description":]]
//
//        //query
//        database.collection(worksheetCollection).whereField("Email", isEqualTo: email).getDocuments() { (querySnapshot, error) in
//                if let error = error {
//                    print("Error getting documents: \(error)")
//                } else {
//                    if(querySnapshot != nil){
//                        //key = Employee + #
//                        for key in querySnapshot!.documents{
//                            worksheets.updateValue(field, forKey: key)
//                        }
//
//                    }
//
//                    //sort documents by time
//                        //must sort here
//                    for key in worksheets.keys{
//                        print(key)
//                        self.numOfDocs += 1
//                    }
//                    if(worksheets.isEmpty){
//                        print("Empty")
//                    }
//                }
//        }
//        return worksheets
//    }
    
    public func fetchWorksheetsOfWorkerWithStatusSent(email: String) -> [String:[String:Any]]{
        var worksheetsCopy: [String:[String:Any]] = ["":["":""]]
        
        database.collection(worksheetCollection).whereField("Email", isEqualTo: email).whereField("Status", isEqualTo: "Sent").getDocuments(){
            (querySnapshot, error) in
            //
            
        }
        
        return worksheetsCopy
    }
    
    //used by superintendent to retrieve documents from workers
    public func fetchWorksheetsWithStatusSent() -> [String:[String:Any]]{
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
    
    //used to fetch worksheets for this current week(worker)
    public func fetchWeeklyWorksheetsOfWorker(email: String) -> [String:[String:Any]]{
        var weeklyWorksheets: [String:[String:Any]] = ["":["":""]]
        return weeklyWorksheets
    }
    
    //used to fetch worksheets for this current week(superintendent)
    public func fetchWeeklyWorksheetsForSuperintendent() -> [String:[String:Any]]{
        var weeklyWorksheets: [String:[String:Any]] = ["":["":""]]
        return weeklyWorksheets
    }
    
    //used to send data about user's name
    public func sendUserName(email: String, employee: String) -> Void{
        database.collection(workerCollection).document(email).setData(["Name": employee])
    }
    
    //used to send data about user's mail (creates new document with email as documentId)
    public func sendUserEmail(email: String) -> Void{
        //creates new empty document
        database.collection(workerCollection).document(email).setData([:])
    }
    
    //used to send data about user's workplaces
    public func sendUserWorkPlaces(email: String, workPlaces: [String]) -> Void{
        if(true){
            database.collection(workerCollection).document(email).setData(["Workplaces": workPlaces])
        }
    }
    
    //used to send data about user's role
    public func sendUserRole(email: String, role: Role, allowed: Bool) -> Void{
        //if validated by superintendant
        if(allowed){
            database.collection(workerCollection).document(email).setData(["Role": role.toString()])
        }
    }
    
    //used to send worksheet
    public func sendWorksheet(employee: String, start: Date, end: Date, status: Status, tasks: String) -> Void{
        //if error is nil send
        if(validateWorksheet(start: start, end: end, tasks: tasks)==nil){
            //NUMBER = NUMBER OF THE NEW WORKSHEET (IF USER HAS 4, NUMBER = 5 (+1))
            database.collection("\(worksheetCollection)").document("\(employee)NUMBER")
            .setData(["Employee": employee, "StartTime": start, "EndTime": end, "Tasks": tasks, "Status": status.rawValue], merge: true)
        } else {
            //send flag to display alert to user
        }
    }
    
    //used by superintendent to 
    
    enum FieldsErrorType: Error {
        case incompleteFields //if tasks description is empty
        case dateInverted //if end >= start
        case futureDate //if date are in the future
        case similarWorksheets //if worksheet exists in database with same date and same workplace
        
        func errorDescription() -> String{
            
            switch(self){
            case .incompleteFields:
                return "Certains champs sont vides."
            case .dateInverted:
                return "Les dates entrées sont inversées."
            case .futureDate:
                return "Les dates entrées sont dans le futur."
            case .similarWorksheets:
                return "Il existe une feuille de temps pour cette journée et ce chantier."
            }
        }
    }
    
    //used internally (private) to validate that worksheet sent by user on creation of new worksheet is complete and that there is no confusion
    private func validateWorksheet(start: Date, end: Date, tasks: String) -> Error?{
        var error: Error? = nil

        //validate that tasks description entered is not nil and not an empty string
        guard tasks != "" else {
            error = FieldsErrorType.incompleteFields
            return error
        }

        //validate that the start time is strictly inferior to the end time
        guard start < end else {
            error = FieldsErrorType.dateInverted
            return error
        }
        
        guard start > Date() || end > Date() else {
            error = FieldsErrorType.futureDate
            return error
        }

        //validate that the sheet about to be sent does not match any existing sheet
        //must read user's previous sheets from the database (access them where previously read from the database)
        return error
    }
}
