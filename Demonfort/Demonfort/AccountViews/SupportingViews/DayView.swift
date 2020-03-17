//
//  DayView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-16.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct DayView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Lundi")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
            }.padding([.horizontal],12)
        }.frame(height: 54)
            .background(Color("lightGray"))
            .cornerRadius(12)
            .padding([.horizontal],8)
            
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}
