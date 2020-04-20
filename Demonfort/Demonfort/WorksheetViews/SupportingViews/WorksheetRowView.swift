//
//  WorksheetRowView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-17.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorksheetRowView: View {
    @EnvironmentObject var worksheet: Worksheet
    var startTime: Date
    var endTime: Date
    var workPlace: String
    
    var body: some View {
        VStack{
            HStack{
                Text("From: \(startTime.asString())")
                    .font(.headline)
                    .fontWeight(.medium)
                Spacer()
            }
            HStack{
                Text("To: \(endTime.asString())")
                    .font(.headline)
                    .fontWeight(.medium)
                Spacer()
            }
            
            HStack{
                Text(workPlace)
                Spacer()
                
            }
            HStack{
                Text("Status: MUST RECEIVE STATUS FROM FIREBASE")
                    .fontWeight(.bold)
                    //.foregroundColor(Status.makeColor(/*self.worksheet.workerWorksheets.*/state: "Envoyée"))
                Spacer()
            }
        }.padding([.all],8)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("darkBackground"), lineWidth: 1))
    }
}

struct WorksheetRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorksheetRowView(startTime: Date(), endTime: Date(), workPlace: "123, rue Maisonneuve, Montréal")
    }
}
