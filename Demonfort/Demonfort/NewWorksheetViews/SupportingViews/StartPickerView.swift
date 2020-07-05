//
//  StartPickerView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-23.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct StartPickerView: View {
    @EnvironmentObject var worksheet: Worksheet
    
    var body: some View {
        VStack{
            DatePicker(selection: $worksheet.start, label: {
                Text("Début")
                    .fontWeight(.semibold).frame(minWidth: 80)
                }
                ).labelsHidden()
            
        }
    }
}

struct StartPickerView_Previews: PreviewProvider {
    static let worksheet = Worksheet()
    
    static var previews: some View {
        StartPickerView().environmentObject(worksheet)
    }
}
