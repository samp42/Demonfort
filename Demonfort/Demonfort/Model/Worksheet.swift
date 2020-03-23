//
//  Worksheet.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct SendableWorksheet: Hashable, Codable, Identifiable{
    var id: UInt8
    var workerName: String
    var day: Date
    var startHour: Date
    var endHour: Date
    var workPlace: String
    var tasks: String
    var status: Status
    
    enum Status: String, CaseIterable, Codable, Hashable {
        case sent = "Envoyé"
        case approved = "Approuvé"
    }
}
