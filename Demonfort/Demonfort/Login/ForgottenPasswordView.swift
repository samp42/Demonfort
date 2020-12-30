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
            Spacer()
            HStack {
                Spacer()
                Image("Devauban")
                Spacer()
            }
            Text("Un courriel sera envoyé s'il est connu.")
                .foregroundColor(Color.red)
                .padding([.horizontal])
                .lineLimit(nil)
            HStack {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .textContentType(.emailAddress)
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
                    .foregroundColor(Color("darkText"))
                    .background(Color("DevaubanGreen"))
                    .cornerRadius(12)
            } //HStack
            Spacer()
        }.background(Color.black).edgesIgnoringSafeArea(.all)
    }
}

struct ForgottenPasswordView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        ForgottenPasswordView().environmentObject(session)
    }
}
