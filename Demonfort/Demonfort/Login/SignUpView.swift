//
//  SignUpView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-02.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var worksheet: Worksheet
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordCnfrm: String = ""
    @State private var error: String = ""
    
    func signUp(){
        session.signUp(employee: name, email: email, password: password){(result, error) in
            if let error = error{
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
        worksheet.getWorker(email: email)
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            HStack {
                Spacer()
                Image("Demonfort")
                Spacer()
            }
            Spacer()
                .frame(height: 20)
            VStack{
                
                if(error != ""){
                    Text(error)
                        .foregroundColor(Color.red)
                        .padding([.horizontal])
                        .lineLimit(nil)
                }
                
                HStack {
                    TextField("Nom", text: $name)
                        .keyboardType(.alphabet)
                        .disableAutocorrection(true)
                        .padding(12)
                        .background(Color("textFieldBackground"))
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                
                HStack {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .padding(12)
                        .background(Color("textFieldBackground"))
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                
                HStack {
                    SecureField("Mot de passe", text: $password)
                        .padding(12)
                        .background(Color("textFieldBackground"))
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                
                HStack {
                    SecureField("Confirmez le mot de passe", text: $passwordCnfrm)
                        .padding(12)
                        .background(Color("textFieldBackground"))
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                
                Button(action: {
                    if(self.password==self.passwordCnfrm){
                        self.signUp()
                    } else {
                        self.error = "Different passwords"
                    }
                }){
                    Text("Inscription")
                        .fontWeight(.bold)
                        .padding([.vertical], 12)
                        .padding([.horizontal], 54)
                        .foregroundColor(Color.black)
                        .background(Color.red)
                        .cornerRadius(12)
                }
            }
            
            Spacer()
        }.background(Color.black).edgesIgnoringSafeArea(.all)
    }//End of var body
}//End of SignUpView

struct SignUpView_Previews: PreviewProvider {
    static let session = SessionStore()
    static let worksheet = Worksheet()
    
    static var previews: some View {
        SignUpView().environmentObject(session).environmentObject(worksheet)
    }
}
