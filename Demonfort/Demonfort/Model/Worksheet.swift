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

class Worksheet: Worker{

    @Published var start: Date // start date and hour of the current worksheet to be sent
    @Published var end: Date // end date and hour of the current worksheet to be sent
    @Published var selectedWorkPlace: Int // workplace selected for the worksheet to be sent
    @Published var tasks: String // tasks description for the current worksheet
    @Published var status: Status = .notSent // status of the worksheet
    
    init(email: String){
        start = Date()
        end = Date().addingTimeInterval(100000)
        selectedWorkPlace = 0
        tasks = ""
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //ERROR
        //Unexpectedly found nil while unwrapping an Optional value
        super.init(_email: email)
        print("INITIALIZED: \(workerName)")
    }
    
    func reset() -> Void{
        start = Date()
        end = Date()
        selectedWorkPlace = 0
        tasks = ""
    }
}
