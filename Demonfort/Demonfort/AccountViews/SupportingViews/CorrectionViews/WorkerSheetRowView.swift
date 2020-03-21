//
//  WorkerSheetRowView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorkerSheetRowView: View {
    var body: some View {
        HStack {
            VStack{
                HStack {
                    Text("John Doe")
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                }
                HStack{
                    Text("12 juin 2020")
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack{
                    Text("123, rue Maisonneuve, Montréal")
                    Spacer()
                }
            }
        //NavigationLink(destination: WorkerSheetDetailView())
        }.padding([.all],8)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("darkBackground"), lineWidth: 2))
    }
}

struct WorkerSheetRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkerSheetRowView()
    }
}
