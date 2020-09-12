//
//  StartPickerView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-23.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct StartPickerView: View {
    @State private var start = Date()
    
    var body: some View {
        VStack{
            DatePicker(selection: $start, label: {
                Text("Début")
                    .fontWeight(.semibold).frame(minWidth: 80)
                }
                ).labelsHidden()
            
        }
    }
}

struct StartPickerView_Previews: PreviewProvider {
    
    static var previews: some View {
        StartPickerView()
    }
}
