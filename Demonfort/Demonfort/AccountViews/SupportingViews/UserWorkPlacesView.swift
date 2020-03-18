//
//  UserWorkPlacesView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-14.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct UserWorkPlacesView: View {
   
    @EnvironmentObject var global: GlobalEnvironment
    
    var body: some View {
        ForEach(0..<self.global.workPlaces.count){place in
            HStack {
                Text(self.global.workPlaces[place])
                    .font(.headline)
                    .padding(.bottom, 4)
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
