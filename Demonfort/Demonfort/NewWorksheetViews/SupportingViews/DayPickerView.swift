//
//  DayPickerView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-23.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct DayPickerView: View {
    @EnvironmentObject var worksheet: Worksheet
    
    var body: some View {
        VStack{
            DatePicker(selection: $worksheet.day, label: {
                Text("Journée")
                    .fontWeight(.semibold).frame(minWidth: 80)
            }).labelsHidden()
        }
    }
}

struct DayPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DayPickerView().environmentObject(Worksheet())
    }
}
