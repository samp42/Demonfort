//
//  WorksheetRowView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-17.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorksheetRowView: View {
    var body: some View {
        VStack{
            HStack {
                Text("12 juin 2020")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
                    .frame(width: 10)
                Text("7h à 15h")
                    .font(.headline)
                    .fontWeight(.medium)
                Spacer()
            }
            HStack{
                Text("123, rue Maisonneuve, Montréal")
                Spacer()
                
            }
        }.padding([.all],8)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("darkBackground"), lineWidth: 2))
    }
}

struct WorksheetRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorksheetRowView()
    }
}
