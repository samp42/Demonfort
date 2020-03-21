//
//  WorkPlaceInfoView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorkPlaceInfoView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Chantier")
                .font(.headline)
            Text("123, rue Maisonneuve, Montréal")
        }
    }
}

struct WorkPlaceInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WorkPlaceInfoView()
    }
}
