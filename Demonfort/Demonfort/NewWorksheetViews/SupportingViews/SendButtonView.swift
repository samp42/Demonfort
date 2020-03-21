//
//  SendButtonView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-17.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct SendButtonView: View {
    @State private var show2SheetsAlert = false
    
    var startTime: Date = Date()
    var endTime: Date = Date()
    
    var body: some View {
        HStack{
            Spacer()
            
            Button(action: {
                //if worksheet exist for this worker on this date:
                if(true){
                    self.show2SheetsAlert = true
                }
            }) {
                Text("Envoyer")
                    .foregroundColor(Color("darkText"))
                    .fontWeight(.heavy)
                    .frame(width: 256)
                }.alert(isPresented: $show2SheetsAlert, content: {
                    Alert(title: Text("Une feuille de temps existe déjà pour cette journée."), message: Text("Envoyer la feuille de temps malgré tout?"), primaryButton: .default(Text("Non")), secondaryButton: .default(Text("Oui")))
                })
            .padding([.vertical], 8)
            .background(Color("darkBackground"))
            .cornerRadius(10)
            
            Spacer()
        }
    }
}

struct SendButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SendButtonView()
        //startTime: , endTime:
    }
}

