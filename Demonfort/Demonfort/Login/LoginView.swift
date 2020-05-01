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
    @State private var isAppPresented = false
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Spacer()
                Image("Demonfort")
                Spacer()
            }
            
            Button(action: {self.isAppPresented = true}){
                Text("Se connecter")
                    .padding([.vertical], 10)
                    .padding([.horizontal], 12)
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .background(Color.white)
            }.sheet(isPresented: $isAppPresented, content: {ContentView()}).cornerRadius(10)
//            Button(action:{
//                //connect user with Firebase magic
//                //Get the default auth UI object
//                let authUI = FUIAuth.defaultAuthUI()
//
//                guard authUI != nil else{
//                    //log the error
//                    return
//                }
//
//                //Set ourselves as the delegate
//                //authUI?.delegate = self
//
//                //Get a reference to the auth UI view
//
//
//                //Show it....
//            }){
//                Text("Se connecter")
//                    .font(.headline)
//                    .foregroundColor(Color.black)
//                    .padding([.vertical], 10)
//                    .padding([.horizontal], 60)
//            }.background(Color.white)
//                .cornerRadius(10)
            Spacer()
        }.background(Color.black).edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(Worksheet())
    }
}
