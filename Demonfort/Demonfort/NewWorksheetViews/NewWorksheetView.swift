//
//  NewWorksheetView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import Firebase

class Worksheet: ObservableObject{
    @Published var workPlaces: [String]
    
    @Published var day: Date
    @Published var startTime: Date
    @Published var endTime: Date
    @Published var selectedWorkPlace: Int
    @Published var tasks: String
    
    let database = Firestore.firestore()

    init(){
        workPlaces = ["1"]
        day = Date()
        startTime = Date()
        endTime = Date()
        selectedWorkPlace = 0
        tasks = ""
    }
    
    func reset() -> Void{
        //reset data on press of send button
    }
}

struct NewWorksheetView: View {
    
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
    static var previews: some View {
        NewWorksheetView().environmentObject(Worksheet())
    }
}
