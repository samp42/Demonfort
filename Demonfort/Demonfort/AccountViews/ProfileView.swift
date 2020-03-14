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
                }
                Spacer()
            }.padding([.all], 8).frame(height: 128).frame(minWidth:360).overlay(RoundedRectangle(cornerRadius: 20).foregroundColor(Color.black).opacity(0.1))
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
