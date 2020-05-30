//
//  EditUsersView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-13.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct EditUsersView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Gérer les utilisateurs")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.red)
                .padding([.vertical], 6)
            Spacer()
        }.background(Color("darkBackground"))
            .cornerRadius(8)
    }
}

struct EditUsersView_Previews: PreviewProvider {
    static var previews: some View {
        EditUsersView()
    }
}
