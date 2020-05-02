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
                }
                HStack {
                    TextField("Email", text: $email)
                        .padding(12)
                        .background(Color.white)
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                HStack {
                    SecureField("Password", text: $password)
                        .padding(12)
                        .background(Color.white)
                        .cornerRadius(12)
                }.padding([.horizontal], 12)
                Button(action: {
                    //sign in
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
                    .frame(height: 8)
                Button(action:{}){
                    Text("Mot de passe oublié")
                        .foregroundColor(Color.gray)
                }
            
            }
            Spacer()
            NavigationLink(destination: SignUpView()){
                Text("Inscription")
            }
        }.background(Color.black).edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        LoginView().environmentObject(session)
    }
}
