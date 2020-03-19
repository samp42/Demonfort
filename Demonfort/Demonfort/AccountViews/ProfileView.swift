//
//  ProfileView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-12.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {

            HStack{
                ZStack{
                    AccountImageView()
                        //.overlay(Circle().stroke(Color.gray, lineWidth: 2))
                }
                
                VStack(alignment: .leading){
                    Text("Simon Fonseca")
                        .fontWeight(.heavy)
                        .font(.title)
                    Text("Surintendant")
                        .font(.headline)
                    Spacer()
                    Button(action:{/*signout + toggle signout alert IF successful*/}){
                        Text("Déconnexion")
                            .foregroundColor(Color("lightText"))
                            .fontWeight(.medium)
                    }
                }
                Spacer()
            }.padding([.all], 8).frame(height: 144).frame(minWidth:360)
                .background(Color("lightGray")
                    .cornerRadius(20)
        )
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
