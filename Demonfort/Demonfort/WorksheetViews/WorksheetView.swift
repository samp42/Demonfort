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
            /**
                *To do:
                    *Lock Navigation View title so that it scrolls with the list instead of staying in place
                    *Insert optionnal error message under Navigation View title if loading documents from firebase was to fail
                    *Make WorksheetRowView() retrieve its data from Worksheet.worksheets
                    *Make the list adjust for the number of documents retrieved from firebase
             */
            List{
                ForEach(0..<25){_ in
                    WorksheetRowView(startTime: Date(), endTime: Date(), workPlace: "123, rue Maisonneuve, Montréal")
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
