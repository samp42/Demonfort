//
//  LoginView.swift
//  
//
//  Created by Samuel Proulx on 2020-03-19.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Spacer()
                Image("Demonfort")
                Spacer()
            }
            Button(action:{}){
                Text("Se connecter")
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .padding([.vertical], 10)
                    .padding([.horizontal], 60)
            }.background(Color.white)
                .cornerRadius(10)
            Spacer()
        }.background(Color.black).edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
