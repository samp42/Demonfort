//
//  WorksheetFormView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-14.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import Firebase

struct WorksheetFormView: View {
    //let dateComponents = DateComponents( hour: 9, minute: 0)
    //let date = Calendar.current.date(from: dateComponents)
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Date").font(.headline)){
                    HStack{
                        Text("Début")
                            .font(.headline)
                        Spacer()
                    }
                    
                    StartPickerView()
                    
                    HStack{
                        Text("Fin")
                            .font(.headline)
                        Spacer()
                    }
                    
                    EndPickerView()
                    
                }
                
                Section(header: Text("Chantier").font(.headline)) {
                    WorkPlacePickerView()
                }
                
                Section(header: Text("Tâches effectuées").font(.headline)) {
                    TasksView()
                }
                    
            }//End of form
           
            SendButtonView()
            
            Spacer()
        }//End of VStack
        
    }
}

struct WorksheetFormView_Previews: PreviewProvider {
    static let worksheet = Worksheet()
    
    static var previews: some View {
        WorksheetFormView().environmentObject(worksheet)
    }
}
