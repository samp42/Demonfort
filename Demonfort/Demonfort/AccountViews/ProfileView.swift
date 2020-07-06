//
//  ProfileView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-12.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct CurrentUser{
    var userName: String = ""
    var userWorkPlaces: [String] = []
    var userRole: Role = .worker
}

struct ProfileView: View {
    @EnvironmentObject var worksheet: Worksheet
    @EnvironmentObject var session: SessionStore
    @State private var currentUser: CurrentUser = CurrentUser()
    
    func getInfoOfCurrentUser(email: String) -> Void{
        if let _ = Auth.auth().currentUser{
            self.currentUser.userName = self.worksheet.fetchName(email: Auth.auth().currentUser!.email!)
            self.currentUser.userWorkPlaces = self.worksheet.fetchWorkPlaces(email: Auth.auth().currentUser!.email!)
            self.currentUser.userRole = self.worksheet.fetchRole(email: Auth.auth().currentUser!.email!)
        }
    }
    
    var body: some View {

            HStack{
                Spacer()
                    .frame(width: 10)
                
                VStack(alignment: .leading){
                    Spacer()
                    
                    Text("\(self.currentUser.userName)")
                        .fontWeight(.semibold)
                        .font(.headline)
                    
                    Text("\(self.currentUser.userRole.toStringFrench())")
                        .font(.subheadline)
                    
                    Spacer()
                } 
                
                Spacer()
                
                Button(action: {
                    self.session.signOut()
                }){
                    Text("Déconnexion").foregroundColor(Color("lightText"))
                        .fontWeight(.medium)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(8)
                }
                
            }.padding([.all], 8).frame(height: 72).frame(minWidth:360)
                .background(Color("lightGray"))
                .cornerRadius(12)
                .onAppear{
                    self.getInfoOfCurrentUser(email: Auth.auth().currentUser!.email!)
                }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static let worksheet = Worksheet()
    static let session = SessionStore()
    
    static var previews: some View {
        ProfileView().environmentObject(worksheet).environmentObject(session)
    }
}
