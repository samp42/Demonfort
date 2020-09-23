//
//  EditUsersView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-13.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

//struct UserToFetch{
//    var (name, role, workPlaces): (String, String, [String])
//}

struct EditUsersView: View {
    @EnvironmentObject var worker: Worker
    
//    @State private var user: [UserToFetch]
    
//    init(){
//        worker.fetchWorker(){workers in self.user = workers}
//    }
    
    var body: some View {
        HStack {
            Spacer()
            List{
                ForEach(0..<5){_ in
                    EditUserRowView(name: "Test Name", role: "Test Role", workPlaces: ["Work Place 1","Work Place 2"])

                }
            }.navigationBarTitle("Personnel")
//                .onAppear{
//                    //fetchWorkers "returns" multiple tuples (one tuple per worker fetched)
//                    //GOTTA FIX THIS
//                    self.worker.fetchWorkers(){(name, role, workPlaces) in
//                        self.user.name = name
//                        self.user.role = role
//                        self.user.workPlaces = workPlaces
//                    }
//                }
            Spacer()
        }
    }
}

struct EditUsersView_Previews: PreviewProvider {
    static let worker = Worker.makeMockWorker()
    
    static var previews: some View {
        EditUsersView().environmentObject(worker)
    }
}
