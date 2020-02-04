//
//  NewWorksheetView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct NewWorksheetView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Nouvelle feuille de temps")
            .font(.title)
            .fontWeight(.heavy)
            VStack{
                HStack{
                    Text("Date")
                    Spacer()
                }
                Text("date picker here")
            }
            
        }.padding(10)
    }
}

struct NewWorksheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorksheetView()
    }
}
