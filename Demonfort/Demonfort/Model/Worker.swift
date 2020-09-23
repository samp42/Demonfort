//
//  Worker.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-04-22.
//  Copyright © 2020 Demonfort. All rights reserved.
//

public enum Role: String{
    case superintendent = "Superintendent", worker = "Worker"
    
    func toString() -> String{
        switch self {
        case .superintendent:
            return "Superintendent"
        case .worker:
            return "Worker"
        }
    }
    
    func toStringFrench() -> String{
        switch self {
        case .superintendent:
            return "Superintendant"
        case .worker:
            return "Ouvrier"
        }
    }
    
}

struct Worker {
    
    // MARK: - Properties
    
    //worker name
    public let name: String
    
    //worker role (superintendent/worker)
    public let role: Role
    
    //worker's workplaces
    public let workplaces: [String]
    
    //worker's worksheets
    public let worksheets: [String:[String:Any]]
    
    //number of documents is handled by class DatabaseManager
    //woksheets for the week
    public let weeklyWorksheets: [String:[String:Any]]
    
    // MARK: - Initialization
    
    public init(name: String, role: Role, workplaces: [String], worksheets: [String: [String: Any]], weeklyWorksheets: [String:[String:Any]]) {
        self.name = name
        self.role = role
        self.workplaces = workplaces
        self.worksheets = worksheets
        self.weeklyWorksheets = weeklyWorksheets
    }
    
    public init?(JSON: [String: Any]) {
        guard let name = JSON["Name"] as? String,
              let roleString = JSON["Role"] as? String,
              let workplaces = JSON["Workplaces"] as? [String],
              let role = Role(rawValue: roleString) else { return nil }
        
        // Initialize the instance's properties.
        self.name = name
        self.role = role
        self.workplaces = workplaces
        self.worksheets = [:]
        self.weeklyWorksheets = [:]
    }
    
    // MARK: - Helper methods
    
    public static func makeMockWorker() -> Worker {
        return Worker(name: "Nom utilisateur", role: .worker, workplaces: ["123 rue d'Ici", "456 rue d'Ailleurs"], worksheets: ["":["":""]], weeklyWorksheets: ["":["":""]])
    }
    
}
