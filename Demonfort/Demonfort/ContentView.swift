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
    @EnvironmentObject var session: SessionStore
    
    func getUser(){
        session.listen()
    }
    
    var body: some View {
        VStack{
            Group{
                if(session.session == nil){
                    HeaderView()
                    MainView().environmentObject(worksheet)
                } else {
                    LoginView()
                }
            }
        }.onAppear(perform: getUser)//outer group
    }
}

struct ContentView_Previews: PreviewProvider {
    static let worksheet = Worksheet()
    static let session = SessionStore()
    
    static var previews: some View {
        ContentView().environmentObject(worksheet).environmentObject(session)
    }
}
