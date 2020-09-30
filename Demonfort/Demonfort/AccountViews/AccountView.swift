//
//  AccountView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-12.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var session: SessionStore
    //@EnvironmentObject var session: SessionStore
    var body: some View {
            
        ScrollView(.vertical) {
            VStack{
                ProfileView()
                
                Spacer()
                    .frame(height: 10)
                
                NavigationLink(destination: SettingsView()){
                    SettingsButtonView()
                }
                
                Spacer()
                    .frame(height: 10)
                
                //if superintendent
                if(self.session.worker!.role==Role.superintendent) {
                    NavigationLink(destination: EditUsersView()){
                        EditUsersButtonView()
                    }
                }
                
                Spacer()
                    .frame(height: 20)
                if(self.session.worker!.role==Role.worker){
                        HStack {
                            Text("Jours de la semaine")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        WeekDaysView()
                    }
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Text("Chantiers")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    UserWorkPlacesView()
                
            }.padding([.horizontal], 16)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static let session = SessionStore()
    //static let session = SessionStore()
    
    static var previews: some View {
        AccountView().environmentObject(session)
    }
}
