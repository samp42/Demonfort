//
//  Worker.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

//IMPLEMENT SWIPE TO REFRESH

class Worker: ObservableObject{
    @Published var workPlaces: [String] //workplaces of the employee retrieved from database
    @Published var fields: [String:Any]
    @Published var workerWorksheets: [[String:Any]]
    var forCount: Int
    let database = Firestore.firestore()
    
    init(){
        self.workerWorksheets = []
        self.workPlaces = ["123 rue Maisonneuve, Montréal", "456 rue Waverly, Montréal"]
        self.fields = [:]
        forCount = 0
        
        //initialise user worksheets
        database.collection("worksheets").whereField("Employee", isEqualTo: "Samuel Proulx").order(by: "StartTime", descending: true).getDocuments{ (querySnapshot, error) in
                    
            if error == nil && querySnapshot != nil{
                if let error = error {
                    print("Error getting documents: \(error)")
                    //display alert to user HERE
                } else {
                    for document in querySnapshot!.documents {
                        //print("\(document.documentID) => \(document.data())")
                        //append to workerWorksheets
                        self.fields.merge(document.data(), uniquingKeysWith: {(old,_) in old})
                        self.workerWorksheets.append(self.fields)
                    }
                }
            }
        }// end of database.getDocuments
        for (key, value) in fields{
            print("YOOOOOO::\(key):\(value)")
        }
    }//end of init
    
    func refresh() -> Void{
        database.collection("worksheets").whereField("Employee", isEqualTo: "Samuel Proulx").order(by: "StartTime", descending: true).getDocuments{ (querySnapshot, error) in
                    
            if error == nil && querySnapshot != nil{
                if let error = error {
                    print("Error getting documents: \(error)")
                    //display alert to user HERE
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        //append to workerWorksheets
                        self.fields.merge(document.data(), uniquingKeysWith: {(_,new) in new})
                        self.workerWorksheets.append(self.fields)
                    }
                }
            }
        }// end of database.getDocuments
    }
    
}
