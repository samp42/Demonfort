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
    @State private var selection = 2 //open on new worksheet view by default
    
    var body: some View {
        VStack{
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
                
                    AccountView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Compte")
                        }
                    }
                    .tag(2)
                }//End of TabView
                .accentColor(Color.red)
            } else {
                 ScrollView(.vertical){
                    AccountView()
                }
            }
        }//inner group
    }
}

struct MainView_Previews: PreviewProvider {
    static let worksheet = Worksheet()
    
    static var previews: some View {
        MainView().environmentObject(worksheet)
    }
}
