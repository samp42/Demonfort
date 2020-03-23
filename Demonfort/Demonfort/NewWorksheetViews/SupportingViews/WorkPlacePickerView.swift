//
//  WorkPlacePickerView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-23.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorkPlacePickerView: View {
    @EnvironmentObject var worksheet: Worksheet
    
    var body: some View {
        VStack{
            Picker(selection: $worksheet.selectedWorkPlace, label: Text("Chantier")) {
                ForEach(0..<self.worksheet.workPlaces.count) {
                    Text(self.worksheet.workPlaces[$0])
                }
            }.pickerStyle(WheelPickerStyle())
                .labelsHidden()
                .frame(height: 180)
        }
    }
}

struct WorkPlacePickerView_Previews: PreviewProvider {
    static var previews: some View {
        WorkPlacePickerView().environmentObject(Worksheet())
    }
}
