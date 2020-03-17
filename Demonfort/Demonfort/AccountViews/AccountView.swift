//
//  AccountView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-12.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack{
            ProfileView()
            Spacer()
            .frame(height: 20)
            HStack {
                Text("Jours de la semaine")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            WeekDaysView()
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Chantiers")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            UserWorkPlacesView()
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Feuilles à approuver")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
        }.padding([.horizontal], 8)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
