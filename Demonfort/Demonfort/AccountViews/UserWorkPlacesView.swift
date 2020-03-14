//
//  UserWorkPlacesView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-14.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct UserWorkPlacesView: View {
    let workPlaces = ["RueX", "Waverly", "Maisonneuve"]
    
    var body: some View {
        ForEach(0..<workPlaces.count){place in
            HStack {
                Text(self.workPlaces[place])
                    .font(.headline)
                    .padding(.bottom, 4)
                    .padding(.leading, 8)
                Spacer()
            }
        }
    }
}

struct UserWorkPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        UserWorkPlacesView()
    }
}
