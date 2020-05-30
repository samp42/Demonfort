//
//  LoginView.swift
//  
//
//  Created by Samuel Proulx on 2020-03-19.
//

import SwiftUI
import FirebaseAuth
import FirebaseUI

struct LoginView: View {
    @EnvironmentObject var session: SessionStore
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var error: String = ""
    
    func signIn(){
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
                }
                
                HStack {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .padding(12)
                        .background(Color.white)
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                
                HStack {
                    SecureField("Mot de passe", text: $password)
                        .padding(12)
                        .background(Color.white)
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                
                Button(action: {
                    self.signIn()

                }){
                    Text("Connexion")
                        .fontWeight(.bold)
                        .padding([.vertical], 12)
                        .padding([.horizontal], 54)
                        .foregroundColor(Color.black)
                        .background(Color.red)
                        .cornerRadius(12)
                }
                
                Spacer()
                    .frame(height: 12)
                
                Button(action:{}){
                    Text("Mot de passe oublié")
                        .foregroundColor(Color.gray)
                }
            
            }
            
            Spacer()
            
            NavigationLink(destination: SignUpView()){
                Text("Inscription")
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
                .frame(height: 12)
        }.background(Color.black).edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        LoginView().environmentObject(session)
    }
}
