//
//  WorksheetRepository.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-09-19.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import Firebase
import FirebaseFirestore

struct WorksheetRepository {
    
    // MARK: - Properties
    
    private let database: Firestore
    
    // MARK: - Initialization
    
    init(database: Firestore) {
        self.database = database
    }
    
    func sendWorksheet(employee: String, start: Date, end: Date, status: Status, tasks: String) -> Void{
        //if error is nil send
        if(errorInWorksheet(start: start, end: end, tasks: tasks) == nil){
            //NUMBER = NUMBER OF THE NEW WORKSHEET (IF USER HAS 4, NUMBER = 5 (+1))
            database.collection("worksheets").document()
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
                return "Les dates entrées ne se sont pas encore produites."
            case .similarWorksheets:
                return "Il existe une feuille de temps pour cette journée et ce chantier."
            }
        }
    }
    
    //used internally (private) to validate that worksheet sent by user on creation of new worksheet is complete and that there is no confusion
    private func errorInWorksheet(start: Date, end: Date, tasks: String) -> Error?{
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
