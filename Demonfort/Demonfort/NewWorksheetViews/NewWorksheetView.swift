//
//  NewWorksheetView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

enum Status: String{
    case sent = "Sent"
    case approved = "Approved"
}

class Worksheet: ButtonManager, ObservableObject{
    @Published var workPlaces: [String]
    
    @Published var day: Date
    @Published var startTime: Date
    @Published var endTime: Date
    @Published var selectedWorkPlace: Int
    @Published var tasks: String
    @Published var status: Status = Status.sent
    
    let database = Firestore.firestore()

    //super init(){}
    
    override init(){
        workPlaces = ["1"]
        day = Date()
        startTime = Date()
        endTime = Date()
        selectedWorkPlace = 0
        tasks = ""
    }
    
}

struct NewWorksheetView: View {
    @EnvironmentObject var worksheet: Worksheet
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Nouvelle feuille de temps")
            .font(.title)
            .fontWeight(.heavy)
            
            Spacer()
                .frame(height: 10)
            
            WorksheetFormView().environmentObject(Worksheet())
            
            
        }//End of VStack
        .padding(10)
    }
}

struct NewWorksheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorksheetView().environmentObject(Worksheet())
    }
}
