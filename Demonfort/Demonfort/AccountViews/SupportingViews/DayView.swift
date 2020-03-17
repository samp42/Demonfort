//
//  DayView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-16.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

enum approval {
    case notSent, sent, approved
    
    func toString() -> String{
        switch self{
        case .notSent:
            return "Non envoyée"
            
        case .sent:
            return "Envoyée"
            
        case .approved:
            return "Approuvée"
        }
    }
    
    func makeColor(state: String) -> Color{
        //recode this ugly function
        switch state{
        case "Non envoyée":
            return Color.red
            
        case "Envoyée":
            return Color.yellow
            
        case "Approuvée":
            return Color.green
            
        default:
            return Color.red
        }
    }
}

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
                    .foregroundColor(Color.green)
                
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
