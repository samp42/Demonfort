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
        ZStack{
            Rectangle()
                .background(Color.black)
                .frame(minWidth:0, maxWidth: .infinity, minHeight: 140, maxHeight: 140)
           
            
            VStack{
                AccountImageView()
                Spacer()
                    .frame(height:15)
                Text("Simon Fonseca")
                    .fontWeight(.heavy)
                    .font(.headline)
                Text("Surintendant")
                    .font(.subheadline)
            }.offset(y:25)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
