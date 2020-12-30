//
//  WorkPlacePickerView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-23.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorkPlacePickerView: View {
    @EnvironmentObject var session: SessionStore
    @State private var selectedWorkPlace = 0
    
    var body: some View {
        
        VStack{
            if self.session.worker?.workplaces != nil {
                Picker(selection: $selectedWorkPlace, label: Text("Chantier")) {
                    ForEach(0..<self.session.worker!.workplaces!.count) {
                        Text(self.session.worker!.workplaces![$0])
                    }
                }.pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                .frame(height: 180)
            } else {
                Text("Vous n'êtes associez à aucun chantier.")
                    .fontWeight(.heavy)
                    .font(.headline)
                    .foregroundColor(.init(red: 1, green: 0.41, blue: 0.38, opacity: 1.0))
                //pastel red
            }
        }
    }
}

struct WorkPlacePickerView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        WorkPlacePickerView().environmentObject(session)
    }
}
