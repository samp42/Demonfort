//
//  Worksheet.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import Combine
import Firebase
import FirebaseFirestore

enum Status: String{
    case notSent = "Non envoyée"
    case sent = "Envoyée"
    case pendingApproval = "En attente d'approbation"
    case approved = "Approuvée"
    
    static func makeColor(state: String) -> Color{
        //recode this ugly function
        switch state{
            case "Envoyée":
                return Color.yellow
            
            case "En attente d'approbation":
                return Color.yellow
            
            case "Approuvée":
                return Color.green
            
            default:
                return Color.red
        }
    }
    
    static func makeColor(state: Status) -> Color{
        switch state{
            case .notSent:
                return Color.red
            
            case .sent:
                return Color.yellow
            
            case .pendingApproval:
                return Color.yellow
            
            case .approved:
                return Color.green
        }
    }
}

class Worksheet: ObservableObject{
    let database = Firestore.firestore()
    let workerCollection = "workers"
    let worksheetCollection = "worksheets"
    
    @Published var start: Date// start date and hour of the current worksheet to be sent
    @Published var end: Date// end date and hour of the current worksheet to be sent
    @Published var selectedWorkPlace: String// workplace selected for the worksheet to be sent
    @Published var tasks: String// tasks description for the current
    @Published var status: Status = .notSent// status of the worksheet
    
    init(){
        start = Date().addingTimeInterval(-10800) // remove 3 hours
        end = Date()
        selectedWorkPlace = ""
        tasks = ""
    }
    
    func reset() -> Void{
        start = Date().addingTimeInterval(-10800)
        end = Date()
        selectedWorkPlace = ""
        tasks = ""
    }
    
    /*--------Worksheet send functions---------*/
    
    //used to send worksheet
    func sendWorksheet(employee: String, start: Date, end: Date, status: Status, tasks: String) -> Void{
        //if error is nil send
        if(validateWorksheet(start: start, end: end, tasks: tasks)==nil){
            //NUMBER = NUMBER OF THE NEW WORKSHEET (IF USER HAS 4, NUMBER = 5 (+1))
            database.collection("\(worksheetCollection)").document("\(employee)NUMBER")
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
