//
//  ContentView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        VStack{
            HeaderView()
            
            TabView(selection: $selection){
                Text("First View")
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image(systemName: "tray.fill")
                                .foregroundColor(Color.black)
                            Text("Feuilles de temps")
                        }
                    }
                    .tag(0)
                    NewWorksheetView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "plus.square.fill").background(Color.black)
                    }
                }
                .tag(1)
                Text("Second View")
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Compte")
                        }
                }
                    .tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
