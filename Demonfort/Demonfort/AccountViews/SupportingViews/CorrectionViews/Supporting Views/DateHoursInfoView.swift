//
//  DateHoursInfoView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct DateHoursInfoView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("12 juin 2020")
                .font(.system(size: 20))
                .fontWeight(.bold)
            
            Spacer()
                .frame(height: 10)
            
            Text("Heures")
                .font(.headline)
            Text("7h - 15h")
        }
    }
}

struct DateHoursInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DateHoursInfoView()
    }
}
