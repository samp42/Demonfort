//
//  UserWorkPlacesView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-14.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct UserWorkPlacesView: View {
    @EnvironmentObject var worker: Worker

    var body: some View {

        VStack {
            ForEach(0..<self.worker.workplaces.count){place in
                HStack {
                    Text(self.worker.workplaces[place])
                        .font(.headline)
                        .padding(.bottom, 4)
                    Spacer()
                }
            }
        }
    }
}

struct UserWorkPlacesView_Previews: PreviewProvider {
    static let worker = Worker.makeMockWorker()
    
    static var previews: some View {
        UserWorkPlacesView().environmentObject(worker)
    }
}
