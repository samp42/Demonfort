//
//  Worksheet.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

enum Status: String{
    case notSent = "Non envoyée"
    case sent = "Envoyée"
    case approved = "Approuvée"
    
    func makeColor(state: String) -> Color{
        //recode this ugly function
        switch state{
            
        case "Envoyée":
            return Color.yellow
            
        case "Approuvée":
            return Color.green
            
        default: //"Non Envoyée"
            return Color.red
        }
    }
    
    func makeColor(state: Status) -> Color{
        //recode this ugly function
        switch state{
        case .notSent:
            return Color.red
            
        case .sent:
            return Color.yellow
            
        case .approved:
            return Color.green
        }
    }
}

class Worksheet: Worker{

    @Published var start: Date // start date and hour of the current worksheet to be sent
    @Published var end: Date // end date and hour of the current worksheet to be sent
    @Published var selectedWorkPlace: Int // workplace selected for the worksheet to be sent
    @Published var tasks: String // tasks description for the current worksheet
    @Published var status: Status = .notSent // status of the worksheet
    
    override init(){
        start = Date()
        end = Date().addingTimeInterval(100000)
        selectedWorkPlace = 0
        tasks = ""
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
    
    func validateError() -> Error? {
        var error: Error? = nil

        //validate that tasks description entered is not nil and not an empty string
        guard case _ = tasks != "" else {
            error = FieldsErrorType.incompleteFields
            return error
        }

        //validate that the start time is strictly inferior to the end time
        guard case _ = start < end else {
            error = FieldsErrorType.dateInverted
            return error
        }
        
        guard case  _ = start > Date() || end > Date() else {
            error = FieldsErrorType.futureDate
            return error
        }

        //validate that the sheet about to be sent does not match any existing sheet
        //must read user's previous sheets from the database (access them where previously read from the database)
        return error
    }
    
    func reset() -> Void{
        start = Date()
        end = Date()
        selectedWorkPlace = 0
        tasks = ""
    }
    
}
