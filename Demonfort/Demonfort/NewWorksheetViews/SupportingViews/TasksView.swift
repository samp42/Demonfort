//
//  TasksView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-24.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct TasksView: View {
    @State private var tasks = ""
    
    var body: some View {
        VStack{
            TextField("Description des tâches", text: $tasks)
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    
    static var previews: some View {
        TasksView()
    }
}
