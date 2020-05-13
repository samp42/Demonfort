//
//  WeekDaysView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-17.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WeekDaysView: View {
    let days = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
    var states: [String]
    
    init(){
        self.states = []
    }
    
    var body: some View {
        ForEach(0..<days.count){day in
            VStack {
                DayView(day: self.days[day])
                Spacer()
                .frame(height:10)
            }
        }
    }
}

struct WeekDaysView_Previews: PreviewProvider {
    static var previews: some View {
        WeekDaysView()
    }
}
