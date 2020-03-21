//
//  TaskInfoView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct TaskInfoView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Description des tâches")
                .font(.headline)
            Text("BackgroundTask: no background task exists with identifier 10 (0xa), or it may have already been ended. Break in UIApplicationEndBackgroundTaskError() to debug.")
        }
    }
}

struct TaskInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TaskInfoView()
    }
}
