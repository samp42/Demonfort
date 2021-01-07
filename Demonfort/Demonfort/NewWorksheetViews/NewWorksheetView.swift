//
//  NewWorksheetView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import Combine

struct NewWorksheetView: View {
    @ObservedObject var worksheet = Worksheet()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Nouvelle feuille de temps")
            .font(.title)
            .fontWeight(.heavy)
            
            Spacer()
                .frame(height: 10)
            
            WorksheetFormView()
            
            
        }//End of VStack
        .padding(10)
    }
}

struct NewWorksheetView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        NewWorksheetView().environmentObject(session)
    }
}
