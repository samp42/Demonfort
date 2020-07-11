//
//  ForgottenPasswordView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-13.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct ForgottenPasswordView: View {
    @EnvironmentObject var session: SessionStore
    @State private var email: String = ""
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Image("Demonfort")
                Spacer()
            }
            Text("A email will be sent if the address exists.")
                .foregroundColor(Color.red)
                .padding([.horizontal])
                .lineLimit(nil)
            HStack {
                TextField("Email", text: $email)
                    .padding(12)
                    .background(Color("textFieldBackground"))
                    .cornerRadius(12)
            }.padding([.horizontal], 12)
            Button(action: {
                self.session.sendResetPassword(email: self.email)
            }) {
                Text("Envoyer")
                    .fontWeight(.bold)
                    .padding([.vertical], 12)
                    .padding([.horizontal], 54)
                    .foregroundColor(Color.black)
                    .background(Color.red)
                    .cornerRadius(12)
            }
            
        }.background(Color.black).edgesIgnoringSafeArea(.all)
    }
}

struct ForgottenPasswordView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        ForgottenPasswordView().environmentObject(session)
    }
}
