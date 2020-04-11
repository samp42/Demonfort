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
        switch self{
        case .notSent:
            return Color.red
            
        case .sent:
            return Color.yellow
            
        case .approved:
            return Color.green
        }
    }
}

class Worksheet: ObservableObject{
    var worksheets: [Any] // array of firebase documents from the logged in employee
    
    @Published var workPlaces: [String] //workplaces of the employee retrieved from database
    
    @Published var start: Date // start date and hour of the current worksheet to be sent
    @Published var end: Date // end date and hour of the current worksheet to be sent
    @Published var selectedWorkPlace: Int // workplace selected for the worksheet to be sent
    @Published var tasks: String // tasks description for the current worksheet
    @Published var status: Status = .notSent // status of the worksheet
    
    let database = Firestore.firestore()
    
    init(){
        workPlaces = ["123 rue Maisonneuve, Montréal", "456 rue Waverly, Montréal"]
        start = Date()
        end = Date()
        selectedWorkPlace = 0
        tasks = ""
        worksheets = []
        
        //initialise user worksheets
        database.collection("worksheets").whereField("Employee", isEqualTo: "Samuel Proulx").order(by: "StartTime", descending: true).getDocuments{ (querySnapshot, error) in
            
            if error == nil && querySnapshot != nil{
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
//                for document in querySnapshot!.documents{
//                    //unexpectedly found nil while unwrappring querySnapshot
//                    self.worksheets.append(document.data())
//                    print((self.worksheets[0] as AnyObject).document.data())
//                }
            }
//            guard error == nil && snapshot != nil {
//
//            } else {
//                throw
//            }
        }// end of database.getDocuments
        
       //VERIFY THAT WORKSHEETS IS WELL INITIALISED
        
    }
    
    enum FieldsErrorType: Error {
        case incompleteFields //if tasks description is empty
        case dateInverted //if end >= start
        case similarWorksheets //if worksheet exists in database with same date and same workplace
        
        func errorDescription() -> String{
            
            switch(self){
            case .incompleteFields:
                return "Certains champs sont vides."
            case .dateInverted:
                return "Les dates entrées sont invalides."
            case .similarWorksheets:
                return "Il existe une feuille de temps pour cette journée et ce chantier."
            }
        }
    }
    
    func validateError() -> Error? {
        var error: Error? = nil

        //validate that tasks description entered is not nil and not an empty string
        guard case let worksheetTasks = tasks != "" else {
            error = FieldsErrorType.incompleteFields
            return error
        }

        //validate that the start time is strictly inferior to the end time
        guard case let dates = start < end else {
            error = FieldsErrorType.dateInverted
            return error
        }

        //validate that the sheet about to be sent does not match any existing sheet
        //must read user's previous sheets from the database (access them where previously read from the database)
        return error
    }
    
    func reset() -> Void{
        start = Date()
        end = Date()
        tasks = ""
    }
    
}
