//
//  WorkerRepository.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-09-19.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import FirebaseFirestore

struct WorkerRepository {
    let database = Firestore.firestore()
    
    // MARK: - Properties
    /*
    private let database: Firestore
    
    // MARK: - Initialization
    
    init(database: Firestore) {
        self.database = database
    }*/
    
    // MARK: - Methods
    
    public static func getWorker(withEmail email: String, completionHandler: @escaping ((Swift.Result<Worker, Error>) -> Void)) {
        Firestore.firestore().collection("workers").document(email).getDocument() { (querySnapshot, error) in
            guard error == nil else { completionHandler(.failure(error!)) ; return }
            
            // Unwrap the snapshot object.
            guard let querySnapshot = querySnapshot else { return }
            
            //create worker
            let worker = querySnapshot.data().map { Worker(JSON: $0.self) }
            
            // Call the completion handler.
            completionHandler(.success(worker!!))
            //this is ugly
        }
    }
    
    // gets every persone registered
    public static func getWorkers(completionHandler: @escaping ((Swift.Result<[Worker], Error>) -> Void)) {
        Firestore.firestore().collection("workers").getDocuments() {(querySnapshot, error) in
            guard error == nil else { completionHandler(.failure(error!)) ; return }
            
            // Unwrap the snapshot object.
            guard let querySnapshot = querySnapshot else { return }
            
            // Initialize an array containing the fetched workers.
            let workers = querySnapshot.documents.compactMap { Worker(JSON: $0.data()) }
            
            // Call the completion handler.
            completionHandler(.success(workers))
        }
    }
    
    public static func sendUser(email: String, employee: String, role: Role){
        Firestore.firestore().collection("workers").document(email).setData(["Email": email ,"Name": employee, "Role": role.toString()])
    }
    
    //used to send data about user's name and email
    public func sendUserCoord(email: String, employee: String) -> Void{
        database.collection("workers").document(email).setData(["Email": email ,"Name": employee])
    }
    
    //used to send data about user's workplaces
    public func sendUserWorkPlaces(email: String, workPlaces: [String]) -> Void{
        //if(true){
            database.collection("workers").document(email).setData(["Workplaces": workPlaces])
        //}
    }
    
    //used to send data about user's role
    public func sendUserRole(email: String, role: Role) -> Void{
        database.collection("workers").document(email).setData(["Role": role.toString()])
    }
    
}
