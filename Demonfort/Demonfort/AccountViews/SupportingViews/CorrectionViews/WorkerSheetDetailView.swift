//
//  WorkerSheetDetailView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//
//From this View: be able to accept or reject the sheet and have a textfield to put on comment ONLY IF rejected

import SwiftUI

struct WorkerSheetDetailView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("John Doe")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }
            
            DateHoursInfoView()
            
            Spacer()
            .frame(height: 10)
            
            WorkPlaceInfoView()
            
            Spacer()
            .frame(height: 10)
            
            TaskInfoView()
        }
    }
}

struct WorkerSheetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkerSheetDetailView()
    }
}
