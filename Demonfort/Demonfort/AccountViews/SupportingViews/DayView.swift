//
//  DayView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-16.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var worksheet: Worksheet
    var day: String
    var approvalState: String = "Non envoyée"
    
    var body: some View {
        VStack{
            HStack{
                Text(day)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
                Text(approvalState)
                    .fontWeight(.bold)
                    .foregroundColor(Status.makeColor(state: approvalState))
                
            }.padding([.horizontal],12)
        }.frame(height: 54)
            .background(Color("lightGray"))
            .cornerRadius(12)
    }
}

struct DayView_Previews: PreviewProvider {
    static let worksheet = Worksheet()
    
    static var previews: some View {
        DayView(day: "Lundi")
        //, approvalState: "Approuvée"
        //must take argument for approval state
    }
}
