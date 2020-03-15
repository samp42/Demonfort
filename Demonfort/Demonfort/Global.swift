//
//  General.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-14.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

class GlobalEnvironment: ObservableObject {
    //put all global variables here
    
    @Published var workPlaces = ["RueX", "Waverly", "Maisonneuve"]
}

/*
 Implement as such:
 
    @EnvironmentObject var global: GlobalEnvironment
 
 */

