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
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordCnfrm: String = ""
    @State private var error: String = ""
    
    func signUp() {
        // signup + create new user
        session.signUp(employee: name, email: email, password: password){(result, error) in
            if let error = error{
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
        
        //session.setWorker(email: email)
    }
    
    func signIn() {
        // signin new user
        session.signIn(email: email, password: password){(result, error) in
            if let error = error{
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            HStack {
                Spacer()
                Image("Devauban")
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
                    TextField("Name", text: $name)
                        .keyboardType(.alphabet)
                        .disableAutocorrection(true)
                        .textContentType(.name)
                        .padding(12)
                        .background(Color("textFieldBackground"))
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                
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
                
                HStack {
                    SecureField("Password", text: $password)
//                        .autocapitalization(.none)
//                        .keyboardType(.default)
//                        .disableAutocorrection(true)
                        .textContentType(.none)
                        .padding(12)
                        .background(Color("textFieldBackground"))
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                
                HStack {
                    SecureField("Confirm password", text: $passwordCnfrm)
//                        .autocapitalization(.none)
//                        .keyboardType(.default)
//                        .disableAutocorrection(true)
                        .textContentType(.none)
                        .padding(12)
                        .background(Color("textFieldBackground"))
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                
                Button(action: {
                    if(self.password==self.passwordCnfrm){
                        self.signUp()
                        self.signIn()
                    } else {
                        self.error = "Different passwords"
                    }
                }){
                    Text("Inscription")
                        .fontWeight(.bold)
                        .padding([.vertical], 12)
                        .padding([.horizontal], 54)
                        .foregroundColor(Color("darkText"))
                        .background(Color("DevaubanGreen"))
                        .cornerRadius(12)
                }
            }
            
            Spacer()
        }.background(Color.black).edgesIgnoringSafeArea(.all)
    }//End of var body
}//End of SignUpView

struct SignUpView_Previews: PreviewProvider {
    static let session = SessionStore()
    //session.worker = Worker.makeMockWorker()
    
    static var previews: some View {
        SignUpView().environmentObject(session)
    }
}
