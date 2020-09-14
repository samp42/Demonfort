//
//  EditUserRowView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-09-13.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct EditUserRowView: View {
    var (name, role, workPlaces): (String, String, [String])
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                HStack {
                    Text("\(name)").font(.headline).fontWeight(.heavy)
                    Text("\(role)").font(.subheadline)
                }
                VStack {
                    ForEach(0..<workPlaces.count){i in
                        Text("\(self.workPlaces[i])").font(.body)
                    }
                }
            }//VStack
            Spacer()
        }//HStack
    }
}

struct EditUserRowView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserRowView(name: "Test Name", role: "Test Role", workPlaces: ["Work Place 1","Work Place 2"])
    }
}
