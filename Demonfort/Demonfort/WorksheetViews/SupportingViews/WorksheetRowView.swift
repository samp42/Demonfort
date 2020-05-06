//
//  WorksheetRowView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-17.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorksheetRowView: View {
    var startTime: Date
    var endTime: Date
    var workPlace: String
    
    var body: some View {
        VStack{
            HStack{
                Text("Début: \(startTime.asString())")
                    .font(.headline)
                    .fontWeight(.medium)
                Spacer()
            }
            HStack{
                Text("Fin: \(endTime.asString())")
                    .font(.headline)
                    .fontWeight(.medium)
                Spacer()
            }
            
            HStack{
                Text(workPlace)
                Spacer()
                
            }
        }.padding([.all],8)
//            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("darkBackground"), lineWidth: 1))
    }
}

struct WorksheetRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorksheetRowView(startTime: Date(), endTime: Date(), workPlace: "123, rue Maisonneuve, Montréal")
    }
}
