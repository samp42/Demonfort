//
//  DayView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-16.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct DayView: View {
    var day: String
    //var approvalState: String
    
    var body: some View {
        VStack{
            HStack{
                Text(day)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
                Text("Approuvée")
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
                
            }.padding([.horizontal],12)
        }.frame(height: 54)
            .background(Color("lightGray"))
            .cornerRadius(12)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(day: "Lundi")
        //, approvalState: "Approuvée"
        //must take argument for approval state
    }
}
