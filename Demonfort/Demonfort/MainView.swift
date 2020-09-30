//
//  MainView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-02.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionStore
    @State private var selection = 1 //open on new worksheet view by default for workers and account for superintendents
    
    var body: some View {
        VStack{
            TabView(selection: $selection){
                WorksheetView()
                .tabItem {
                    VStack {
                        Image(systemName: "tray.fill")
                            .foregroundColor(Color.black)
                        Text("Feuilles de temps")
                    }
                }
                .tag(0)
                
               // if(self.session.worker!.role==Role.worker) {
                    NewWorksheetView()
                        .tabItem {
                            VStack {
                                Image(systemName: "plus.square.fill").background(Color.black)
                                Text("Nouvelle feuille")
                            }
                    }
                    .tag(1)
                // }//end of if
                NavigationView{
                    AccountView()
                        .navigationBarTitle("Compte")
                        .navigationBarHidden(true)
                }
                    .tabItem {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Compte")
                        }
                    }
                    .tag(2)
                
            }//End of TabView
                .accentColor(Color("DevaubanGreen"))
        }//inner group
    }
}

struct MainView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        MainView().environmentObject(session)
    }
}
