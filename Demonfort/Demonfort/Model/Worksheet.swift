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

struct Worksheet{
    let database = Firestore.firestore()
    let workerCollection = "workers"
    let worksheetCollection = "worksheets"
    
    let start: Date// start date and hour of the current worksheet to be sent
    let end: Date// end date and hour of the current worksheet to be sent
    let selectedWorkPlace: String// workplace selected for the worksheet to be sent
    let tasks: String// tasks description for the current
    let status: Status = .notSent// status of the worksheet
    
    init(){
        start = Date().addingTimeInterval(-10800) // remove 3 hours
        end = Date()
        selectedWorkPlace = ""
        tasks = ""
    }
    
//    func reset() -> Void{
//        start = Date().addingTimeInterval(-10800)
//        end = Date()
//        selectedWorkPlace = ""
//        tasks = ""
//    }
}
