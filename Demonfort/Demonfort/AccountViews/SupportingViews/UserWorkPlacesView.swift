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
            if self.session.worker?.workplaces != nil {
                ForEach(0..<self.session.worker!.workplaces!.count){place in
                    HStack {
                        Text(self.session.worker!.workplaces![place])
                            .font(.headline)
                            .padding(.bottom, 4)
                        Spacer()
                    }
                }
            } else {
                Text("Vous n'êtes associez à aucun chantier.")
                    .fontWeight(.heavy)
                    .font(.headline)
                    .foregroundColor(.init(red: 1, green: 0.41, blue: 0.38, opacity: 1.0))
                //pastel red
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
