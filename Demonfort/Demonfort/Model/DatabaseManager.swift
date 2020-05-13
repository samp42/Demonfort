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

class DatabaseManager{
    let database = Firestore.firestore()
    let workerCollection = "workers" //documentID: name, document.data: Role
    //future:
        //let workPlacesCollection = "workPlaces" //documentID: address
    let worksheetCollection = "worksheets" //documentID: employee+sheet number, document.data: start, end, workplace, status, tasks
    var numOfDocs: Int = 0
    
    //used to fetch data about a specific user
    func fetchWorker(employee: String) -> Void{
        database.collection(workerCollection).document(employee).getDocument() {(querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                //get info about user
            }
        }
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
    func fetchWorksheets(employee: String, worksheets: [String:[String:Any]]) -> [String:[String:Any]]{
        //copy of worksheets
        var worksheetsCopy: [String:[String:Any]] = worksheets
        
        //query
        database.collection(worksheetCollection).whereField("Employee", isEqualTo: employee)
            .getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    for document in querySnapshot!.documents {
                        //print("\(document.documentID) => \(document.data())")
                        //store documents in dictionary
                        worksheetsCopy.updateValue(document.data(), forKey: "\(document.documentID)")
                    }
                    //sort documents by time
                        //must sort here
                    for key in worksheetsCopy.keys{
                        print(key)
                        self.numOfDocs += 1
                    }
                    if(worksheetsCopy.isEmpty){
                        print("Empty")
                    }
                }
        }
        return worksheetsCopy
    }
    
    //used by superintendent to retrieve documents from workers
    func fetchWorksheetsWithStatusSent(worksheets: [String:[String:Any]]) -> [String:[String:Any]]{
        //copy of worksheets
        var worksheetsCopy: [String:[String:Any]] = worksheets
        
        //query
        database.collection(worksheetCollection).whereField("Status", isEqualTo: "Envoyée")
            .getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    for document in querySnapshot!.documents {
                        //print("\(document.documentID) => \(document.data())")
                        //store documents in dictionary
                        worksheetsCopy.updateValue(document.data(), forKey: "\(document.documentID)")
                    }
                    //sort documents by time
                        //must sort here
                    for key in worksheetsCopy.keys{
                        print(key)
                        self.numOfDocs += 1
                    }
                    if(worksheetsCopy.isEmpty){
                        print("Empty")
                    }
                }
        }
        
        return worksheetsCopy
    }
    
    //used to fetch worksheets for this current week(worker)
    func fetchWeeklyWorksheetsForWorker() -> Void{
        
    }
    
    //used to fetch worksheets for this current week(superintendent)
    func fetchWeeklyWorksheetsForSuperintendent() -> Void{
        
    }
    
    //used to send data about user
    func sendUser(employee: String, workPlaces: [String], role: Role) -> Void{
        if(true){
            database.collection(workerCollection).document(employee).setData(["Workplaces":workPlaces, "Role": role.toString()])
        }
    }
    
    //used to send worksheet
    func sendWorksheet(employee: String, start: Date, end: Date, status: Status, tasks: String) -> Void{
        //if error is nil send
        if(validateWorksheet(start: start, end: end, tasks: tasks)==nil){
            //NUMBER = NUMBER OF THE NEW WORKSHEET (IF USER HAS 4, NUMBER = 5 (+1))
            database.collection("\(self.worksheetCollection)").document("\(employee)NUMBER")
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
