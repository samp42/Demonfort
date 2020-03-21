//
//  WorkerSheetsListView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorkerSheetsListView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Feuilles à approuver")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            List{
                ForEach(0..<10){_ in
                    WorkerSheetRowView()
                }
            }
        }
    }
}

struct WorkerSheetsListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkerSheetsListView()
    }
}
