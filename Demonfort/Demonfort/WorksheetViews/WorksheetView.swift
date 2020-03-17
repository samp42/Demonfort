//
//  WorksheetView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-17.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorksheetView: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(0..<25){_ in
                    Text("Hello world!")
                }
            }.navigationBarTitle("Feuilles de temps")
        }
    }
}

struct WorksheetView_Previews: PreviewProvider {
    static var previews: some View {
        WorksheetView()
    }
}
