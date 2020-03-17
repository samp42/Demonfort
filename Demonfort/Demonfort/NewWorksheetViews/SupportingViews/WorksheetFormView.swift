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
    
    @State private var day: Date = Date()
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var selectedWorkPlace = 0
    @State private var tasks: String = ""

    //let dateComponents = DateComponents( hour: 9, minute: 0)
    //let date = Calendar.current.date(from: dateComponents)
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Date").font(.headline)){
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
                }
                
                Section(header: Text("Chantier").font(.headline)){
                    HStack{
                        Spacer()
                        Picker("Chantier", selection: $selectedWorkPlace) {
                            ForEach(0..<self.global.workPlaces.count) {
                                Text(self.global.workPlaces[$0])
                            }
                        }.pickerStyle(WheelPickerStyle())
                            .labelsHidden()
                            .frame(height: 180)
                        Spacer()
                    }
                }
                
                Section(header: Text("Tâches").font(.headline)){
                    TextField("Description des tâches", text: $tasks)
                }
                    
            }//End of form
           
            SendButtonView()
            
            Spacer()
        }//End of VStack
        
    }
}

struct WorksheetFormView_Previews: PreviewProvider {
    static var previews: some View {
        WorksheetFormView()
    }
}
