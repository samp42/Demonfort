//
//  WorksheetDetailView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-05.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorksheetDetailView: View {
    @EnvironmentObject var worker: Worker
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
            
            Group {
                Spacer()
                    .frame(height: 10)
                WorksheetCorrectionView()
            }
            
            Spacer()
        }
    }
}

struct WorksheetDetailView_Previews: PreviewProvider {
    static let worker = Worker()
    
    static var previews: some View {
        WorksheetDetailView().environmentObject(worker)
    }
}
