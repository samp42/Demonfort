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

/*
 1. public fetchName(email: String, completion: @escaping (String) -> ()) -> Void >>> takes current user's email and gets its name
        Status: Ok
 2. public fetchRole(email: String, completion: @escaping (String) -> ()) -> Void >>> takes current user's email and gets its role
        Status: Ok
 3. public fetchWorkPlaces(email: String, completion: @escaping (String) -> ()) -> Void >>> takes current user's email and gets its work places
        Status: Ok
 4. fetchEmployee(email: String) -> (name: String, workPlaces: [String], role: Role) >>> takes current user's email and gets its name, workPlaces and role
        Status: Ok
 5. fetchWorkers() -> Void >>>                      ?????????????
        Status: IDK WTF is going on
 6. fetchWorksheetsOfWorker(email: String) -> [String:[String:Any]] >>> takes current user's email and gets all its worksheets
        Status: Errors
 7. fetchWorksheetsOfWorkerWithStatusSent(email: String, worksheets: [String:[String:Any]]) -> [String:[String:Any]] >>> takes current user's email and worksheets and gets all its worksheets that have status 'sent'
        Status: TBD
 8. fetchWorksheetsWithStatusSent() -> [String:[String:Any]] >>> takes all worksheets from database and updates it in app for superintendant
        **SUPERINTENDANT ONLY**
        Status: TBD
 9. fetchWeeklyWorksheetsOfWorker(email: String) -> [String:[String:Any]] >>> takes email of current user's and gets all worksheets from the current week
        Status: TBD
 10. fetchWorksheetsWithStatusSent() -> [String:[String:Any]] >>>
        Status: TBD
 11. fetchWeeklyWorksheetsForSuperintendent() -> [String:[String:Any]] >>> gets all worksheets of all workers from the current week
        **SUPERINTENDANT ONLY**
        Status: TBD
 12. sendUserName(email: String, employee: String) -> Void >>> takes current user's email and name and creates or updates document about user's info and places or updates name into it
        Status: OK
 13. sendUserEmail(email: String) -> Void >>> takes current user's email and creates or updates document about user's info
        Status: OK
 14. sendUserWorkPlaces(email: String, workPlaces: [String]) -> Void >>> takes current user's email and work places and creates or updates document about user's info and places or updates work places into it
        Status: OK
 15. sendUserRole(email: String, role: Role, allowed: Bool) -> Void >>> takes current user's email and role and a superintendant's permission to update the user's role
        Status: TBD
 16. sendWorksheet(employee: String, start: Date, end: Date, status: Status, tasks: String) -> Void >>> takes fields of worksheet and creates new document about worksheet in database
        Status: OK
 17. correctWorksheet() -> Void >>> sends back worksheet to be validated..                    ???????????????????? HELP PLZ
        **SUPERINTENDANT ONLY**
        Status: TBD
 18. validateWorksheet(start: Date, end: Date, tasks: String) -> Error? >>> takes start and end times with tasks entered and verify that inputs are valids
        Status: OK
 */

class DatabaseManager{
    
     //documentID: name, document.data: Role
    //future:
        //let workPlacesCollection = "workPlaces" //documentID: address
     //documentID: employee+sheet number, document.data: start, end, workplace, status, tasks
    
//    public func fetchName(email: String) -> String {
//        var name: String = "First Value"
//
//        database.collection(workerCollection).document(email).getDocument() {(querySnapshot, error) in
//            if let error = error {
//                print("Error getting documents: \(error)")
//            } else {
//                //get info about user
//                if (querySnapshot != nil && querySnapshot!.exists){
//                    let documentData = querySnapshot!.data()!
//                    if let nameData = (documentData["Name"] as! String?){
//                        name = nameData
//                    }
//                    print(name)
//                }
//            }
//        }
//
//        return name
//    }
    
    
    
    
}
