//
//  ProfileView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-12.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @EnvironmentObject var worksheet: Worksheet
    @EnvironmentObject var session: SessionStore
    
    var body: some View {

            HStack{
                Spacer()
                    .frame(width: 10)
                
                VStack(alignment: .leading){
                    Text("\(self.worksheet.workerName)")
                        .fontWeight(.heavy)
                        .font(.title)
                    Text("\(self.worksheet.workerRole.toStringFrench())")
                        .font(.headline)
                    Spacer()
//                    Button(action:{/*signout + toggle signout alert IF successful*/
//                            let firebaseAuth = Auth.auth()
//                        do {
//                          try firebaseAuth.signOut()
//                        } catch let signOutError as NSError {
//                          print ("Error signing out: %@", signOutError)
//                        }
//                    }){
                    Button(action: {
                        self.session.signOut()
                    }){
                        Text("Déconnexion").foregroundColor(Color("lightText"))
                                .fontWeight(.medium)
                    }
                            
                }
                Spacer()
            }.padding([.all], 8).frame(height: 100).frame(minWidth:360)
                .background(Color("lightGray")
                    .cornerRadius(20)
        )
    }
}


struct ProfileView_Previews: PreviewProvider {
    static let worksheet = Worksheet()
    
    static var previews: some View {
        ProfileView().environmentObject(worksheet)
    }
}
