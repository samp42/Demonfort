//
//  ContentView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var worksheet: Worksheet
    @State private var selection = 1 //open on new worksheet view by default
    
    var body: some View {
        VStack{
            HeaderView()
            if(self.worksheet.workerRole==Role.worker) {
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
                    NewWorksheetView()
                    .tabItem {
                        VStack {
                            
                            Image(systemName: "plus.square.fill").background(Color.black)
                            Text("Nouvelle feuille")
                        }
                    }
                    .tag(1)
                
                
                    ScrollView(.vertical){
                        AccountView()
                    }
                    .tabItem {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Compte")
                        }
                    }
                    .tag(2)
                }.environmentObject(Worksheet())//End of TabView
                .accentColor(Color.red)
            } else {
                 ScrollView(.vertical){
                    AccountView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Worksheet())
    }
}
