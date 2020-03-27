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
    @Published var workPlaces: [String]
    
    @Published var start: Date
    @Published var end: Date
    @Published var selectedWorkPlace: Int
    @Published var tasks: String
    @Published var status: Status = .notSent
    
    let database = Firestore.firestore()
    
    init(){
        workPlaces = ["123 rue Maisonneuve, Montréal", "456 rue Waverly, Montréal"]
        start = Date()
        end = Date()
        selectedWorkPlace = 0
        tasks = ""
    }
    
    enum ErrorType: Error {
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
    
    func reset() -> Void{
        start = Date()
        end = Date()
        tasks = ""
    }
    
}
