//
//  NewWorksheetView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import Firebase

struct NewWorksheetView: View {
    
    func didLoad(){
        //let database = Firestore.firestore()
        
        //database.collection("workers").addDocument
    }
    
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
        NewWorksheetView()
    }
}
