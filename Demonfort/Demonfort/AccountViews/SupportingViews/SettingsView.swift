//
//  SettingsView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-04-24.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

//used by superintendents to handle users
struct SettingsView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        /**
         Universal:
         - Upload photo (future)
         - Delete account
         Superintendant;
         - Add/remove workers
         - Add/remove workplaces
         - modify workerRole of workers
         - list of all users, their workplaces and their role
         */
        Button(action:{
            
        }){
            Text("Supprimer mon compte")
                .foregroundColor(Color("lightText"))
                .fontWeight(.medium)
                .padding(8)
                .background(Color.red)
                .cornerRadius(8)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        SettingsView().environmentObject(session)
    }
}
