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
            Text("Un courriel sera envoyé si l'adresse email existe.")
            TextField("Email", text: $email)
            Button(action: {
                self.session.sendResetPassword(email: self.email)
            }) {
                Text("Envoyer")
            }
            
        }.background(Color.black)
    }
}

struct ForgottenPasswordView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        ForgottenPasswordView().environmentObject(session)
    }
}
