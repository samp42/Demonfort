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
    @Published var name: String
    @Published var workPlaces: [String] //workplaces of the employee retrieved from database
    @Published var workerWorksheets: [String:[String:Any]] //Dictionary with DocumentID:DocumentData<String,Any> where DocumentData<String> is the document field and DocumentData<Any> is the value
    @Published var numOfDocuments: Int8
    let database = Firestore.firestore()
    
    init(){
        self.name = "Simon Fonseca"
        self.workerWorksheets = [:]
        self.workPlaces = ["123 rue Maisonneuve, Montréal", "456 rue Waverly, Montréal"]
        self.numOfDocuments = 0
        
        //initialise user worksheets
        database.collection("worksheets").whereField("Employee", isEqualTo: "Samuel Proulx").order(by: "StartTime", descending: true).getDocuments{ (querySnapshot, error) in
                    
            if error == nil && querySnapshot != nil{
                if let error = error {
                    print("Error getting documents: \(error)")
                    //display alert to user HERE
                } else {
                    var i=0
                    for document in querySnapshot!.documents {
                        //print("\(document.documentID) => \(document.data())")
                        //append to workerWorksheets
                        //self.fields.merge(document.data(), uniquingKeysWith: {(old,_) in old})
                        self.workerWorksheets.updateValue(document.data(), forKey: document.documentID)
                        //self.fields
                        i+=1
                        print(i)
                    }
                }
            }
        }// end of database.getDocuments
        self.numOfDocuments = Int8(workerWorksheets.count)
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
                    }
                }
            }
        }// end of database.getDocuments
    }
    
}
