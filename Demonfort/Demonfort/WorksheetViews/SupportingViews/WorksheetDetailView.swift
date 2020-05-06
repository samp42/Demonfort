//
//  WorksheetDetailView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-05.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorksheetDetailView: View {
    @EnvironmentObject var worksheet: Worksheet
    var body: some View {
        VStack {
            Group {
                Text("Début")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("123")
                Spacer()
                    .frame(height: 10)
            }
                
            Group{
                Text("Fin")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("123")
                Spacer()
                    .frame(height: 10)
            }
            
            Group{
                Text("Chantier")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("123, rue Maisonneuve, Montréal")
                Spacer()
                .frame(height: 10)
            }
            
            Group{
                Text("Status")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("Envoyée")
            }
            Spacer()
        }
    }
}

struct WorksheetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorksheetDetailView().environmentObject(Worksheet())
    }
}
