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
    @EnvironmentObject var worksheet: Worksheet

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
                    
                   DayPickerView()
                    
                    HStack{
                        Text("Heure de début")
                            .font(.headline)
                        Spacer()
                    }
                    
                    StartPickerView()
                    
                    HStack{
                        Text("Heure de fin")
                            .font(.headline)
                        Spacer()
                    }
                    
                    EndPickerView()
                    
                }
                    
            }//End of form
           
            SendButtonView()
            
            Spacer()
        }//End of VStack
        
    }
}

struct WorksheetFormView_Previews: PreviewProvider {
    static var previews: some View {
        WorksheetFormView().environmentObject(Worksheet())
    }
}
