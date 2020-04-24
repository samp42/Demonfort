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
    let workerCollection = "workers"
    let worksheetCollection = "worksheets"
    
    //used to fetch data about user
    func fetchWorker() -> Void{
        
    }
    
    //used to fetch data about worksheets
    func fetchWorksheets(employee: String, worksheets: [String:[String:Any]]) -> [String:[String:Any]]{
        //copy of worksheets
        var worksheetsCopy: [String:[String:Any]] = worksheets
        
        //query
        database.collection("worksheets").whereField("Employee", isEqualTo: employee)
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
                    }
                    if(worksheetsCopy.isEmpty){
                        print("Empty")
                    }
                }
        }
        return worksheetsCopy
    }
    
    //used to send data about user
    func sendUser(employee: String, workPlaces: [String]) -> Void{
        if(true){
            database.collection(workerCollection).document(employee).setData(["Workplaces":workPlaces])
        }
    }
    
    //used to send worksheet
    func sendWorksheet(employee: String, start: Date, end: Date, status: Status, tasks: String) -> Void{
        //if error is nil send
        if(validateWorksheet(start: start, end: end, tasks: tasks)==nil){
            database.collection("\(self.worksheetCollection)").document("\(employee)NUMBER")
            .setData(["Employee": employee, "StartTime": start, "EndTime": end, "Tasks": tasks, "Status": status.rawValue], merge: true)
        } else {
            //send flag to display alert to user
        }
    }
    
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
