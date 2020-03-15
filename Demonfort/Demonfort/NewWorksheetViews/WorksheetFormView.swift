//
//  WorksheetFormView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-14.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorksheetFormView: View {
    @EnvironmentObject var global: GlobalEnvironment
    
    @State private var tasks: String = ""
    @State private var selectedWorkPlace = 0
    
    var body: some View {
        Form{
            //DateSelectorView()
            
            Spacer()
        
            Picker("Chantier", selection: $selectedWorkPlace) {
                ForEach(0..<self.global.workPlaces.count) {
                    Text(self.global.workPlaces[$0])
                }
            }.pickerStyle(WheelPickerStyle())
            
            Spacer()
            
            TextField("Description des tâches", text: $tasks)
            
            Spacer()
            
            HStack{
                Spacer()
                
                Button(action: {}) {
                    Text("Envoyer")
                        .foregroundColor(Color.white)
                        .fontWeight(.heavy)
                    }.padding([.vertical], 8)
                
                Spacer()
            }.background(Color.black)
                
        }//End of form
    }
}

struct WorksheetFormView_Previews: PreviewProvider {
    static var previews: some View {
        WorksheetFormView()
    }
}
