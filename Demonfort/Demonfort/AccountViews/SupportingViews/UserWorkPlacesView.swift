//
//  UserWorkPlacesView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-14.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct UserWorkPlacesView: View {
    @EnvironmentObject var session: SessionStore

    var body: some View {

        VStack {
            ForEach(0..<self.session.worker!.workplaces.count){place in
                HStack {
                    Text(self.session.worker!.workplaces[place])
                        .font(.headline)
                        .padding(.bottom, 4)
                    Spacer()
                }
            }
        }
    }
}

struct UserWorkPlacesView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        UserWorkPlacesView().environmentObject(session)
    }
}
