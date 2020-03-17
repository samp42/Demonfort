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
    
    var startTime: Date
    var endTime: Date
    
    var body: some View {
        HStack{
            Spacer()
            
            Button(action: {
                self.show2SheetsAlert = true
            }) {
                Text("Envoyer")
                    .foregroundColor(Color("buttonText"))
                    .fontWeight(.heavy)
                    .frame(width: 256)
                }.alert(isPresented: $show2SheetsAlert, content: {
                    Alert(title: Text("Une fiche existe déjà pour cette journée."), message: Text("Envoyer la fiche malgré tout?"), primaryButton: .default(Text("Non")), secondaryButton: .default(Text("Oui")))
                })
            .padding([.vertical], 8)
            .background(Color("buttonBackground"))
            .cornerRadius(10)
            
            Spacer()
        }
    }
}

struct SendButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SendButtonView(startTime: , endTime: )
    }
}
