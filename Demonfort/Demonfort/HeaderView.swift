//
//  HeaderView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-11.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        NavigationView{
            HStack{
                Image("Demonfort")
                    .resizable()
                    .frame(height: 30)
                    .aspectRatio(contentMode: .fit)
                Button(action:{}){
                    Image("system.bubble.left")
                }
            }.background(Color.black)
        }.frame(height: 40)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
