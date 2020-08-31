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
            Image("Devauban")
            Spacer()
        }.edgesIgnoringSafeArea(.vertical)
            .padding([.vertical], 12)
            .background(Color("darkText"))
            .foregroundColor(Color.white)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
