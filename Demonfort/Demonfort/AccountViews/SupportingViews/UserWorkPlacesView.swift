//
//  UserWorkPlacesView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-14.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct UserWorkPlacesView: View {

    @EnvironmentObject var worksheet: Worksheet

    var body: some View {

        VStack {
            ForEach(0..<self.worksheet.workPlaces.count){place in
                HStack {
                    Text(self.worksheet.workPlaces[place])
                        .font(.headline)
                        .padding(.bottom, 4)
                    Spacer()
                }
            }
        }
    }
}

struct UserWorkPlacesView_Previews: PreviewProvider {
    static let worksheet = Worksheet(email: "samuelproulx26@gmail.com")
    
    static var previews: some View {
        UserWorkPlacesView().environmentObject(worksheet)
    }
}
