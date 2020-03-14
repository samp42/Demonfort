//
//  AccountImageView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-12.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct AccountImageView: View {
    var body: some View {
        Image("SimonFonseca")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:120, height:120)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3.0))
    }
}

struct AccountImageView_Previews: PreviewProvider {
    static var previews: some View {
        AccountImageView()
    }
}
