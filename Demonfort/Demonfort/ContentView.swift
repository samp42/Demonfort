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
                    AuthView()
                } else {
                    Group {
                        HeaderView()
                        MainView().environmentObject(worksheet)
                    }
                }
            }
        }.onAppear(perform: getUser)//outer group
    }
}

struct ContentView_Previews: PreviewProvider {
    static let worksheet = Worksheet(email: "samuelproulx26@gmail.com")
    static let session = SessionStore()
    
    static var previews: some View {
        ContentView().environmentObject(worksheet).environmentObject(session)
    }
}
