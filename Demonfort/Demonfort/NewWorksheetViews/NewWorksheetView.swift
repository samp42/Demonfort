//
//  NewWorksheetView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct NewWorksheetView: View {
    @State private var day: Date = Date()
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var tasks: String = ""
    @State private var selectedWorkPlace = 0
    
    var chantiers = ["Coursol", "Waverly"]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Nouvelle feuille de temps")
            .font(.title)
            .fontWeight(.heavy)
            
            Spacer()
                .frame(height: 10)
            
            Form{
                HStack{
                    Text("Journée")
                        .font(.headline)
                    Spacer()
                }
                
                DatePicker(selection: $day, displayedComponents: .date, label: {
                        Text("Journée")
                            .fontWeight(.semibold).frame(minWidth: 80)
                }).labelsHidden()
                
                HStack{
                    Text("Heure de début")
                        .font(.headline)
                    Spacer()
                }
                
                DatePicker(selection: $startTime, displayedComponents: .hourAndMinute, label: {
                        Text("Début")
                            .fontWeight(.semibold).frame(minWidth: 80)
                }).labelsHidden()
                
                HStack{
                    Text("Heure de fin")
                        .font(.headline)
                    Spacer()
                }
                
                DatePicker(selection: $endTime, displayedComponents: .hourAndMinute, label: {
                        Text("Fin")
                            .fontWeight(.semibold).frame(minWidth: 80)
                    }).labelsHidden()
                
                Spacer()
                
                Picker(selection: $selectedWorkPlace, label: Text("Chantier")) {
                    ForEach(0 ..< chantiers.count) {
                        Text(self.chantiers[$0])
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
            
        }//End of VStack
        .padding(10)
    }
}

struct NewWorksheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorksheetView()
    }
}
