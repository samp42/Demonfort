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
        HStack(alignment: .top){
            Spacer()
            Image("Demonfort")
            Spacer()
                //.position(x: 190, y: 95)
                //.resizable()
                //.frame(height: 54)
                //.aspectRatio(contentMode: .fit)
            /*NavigationLink(destination: TextingView()){
                Image(systemName: "bubble.left")
                
            }*/
        }.edgesIgnoringSafeArea(.vertical)
            .padding([.vertical], 12)
            .background(Color.black)
            .foregroundColor(Color.white)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
