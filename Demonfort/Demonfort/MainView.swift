//
//  MainView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-02.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var worksheet: Worksheet
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
                
                if(self.worksheet.workerRole==Role.worker) {
                    NewWorksheetView()
                        .tabItem {
                            VStack {
                                Image(systemName: "plus.square.fill").background(Color.black)
                                Text("Nouvelle feuille")
                            }
                    }
                    .tag(1)
                }
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
                .accentColor(Color.red)
        }//inner group
    }
}

struct MainView_Previews: PreviewProvider {
    static let worksheet = Worksheet()
    
    static var previews: some View {
        MainView().environmentObject(worksheet)
    }
}
