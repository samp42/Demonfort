//
//  WorkerRepository.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-09-19.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import FirebaseFirestore

struct WorkerRepository {
    
    // MARK: - Properties
    
    private let database: Firestore
    
    // MARK: - Initialization
    
    init(database: Firestore) {
        self.database = database
    }
    
    // MARK: - Methods
    
//    public func getWorker(withEmailAddress emailAddress: String, completionHandler: @escaping ((Swift.Result<Worker, Error>) -> Void)) {
//        database.collection("workers").document(emailAddress).getDocument() { (querySnapshot, error) in
//            guard error == nil else { completionHandler(.failure(error!)) ; return }
//            
//            // Unwrap the snapshot object.
//            guard let querySnapshot = querySnapshot else { return }
//            
//            let worker = querySnapshot.data() { Worker(JSON: $0.data()) }
//            
//            // Call the completion handler.
//            completionHandler(.success(worker))
//        }
//    }
    
    public func getWorkers(completionHandler: @escaping ((Swift.Result<[Worker], Error>) -> Void)) {
        database.collection("workers").getDocuments() {(querySnapshot, error) in
            guard error == nil else { completionHandler(.failure(error!)) ; return }
            
            // Unwrap the snapshot object.
            guard let querySnapshot = querySnapshot else { return }
            
            // Initialize an array containing the fetched workers.
            let workers = querySnapshot.documents.compactMap { Worker(JSON: $0.data()) }
            
            // Call the completion handler.
            completionHandler(.success(workers))
        }
    }
    
}
