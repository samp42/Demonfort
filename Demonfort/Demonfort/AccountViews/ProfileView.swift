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
    @EnvironmentObject var session: SessionStore
    
    var body: some View {

            HStack{
                Spacer()
                    .frame(width: 10)
                
                VStack(alignment: .leading){
                    Spacer()
                    
                    Text("\(self.session.worker!.name)")
                        .fontWeight(.semibold)
                        .font(.headline)
                    
                    Text("\(self.session.worker!.role.toStringFrench())")
                        .font(.subheadline)
                    
                    Spacer()
                } 
                
                Spacer()
                
                Button(action: {
                    self.session.signOut()
                }){
                    Text("Déconnexion").foregroundColor(Color("darkText"))
                        .fontWeight(.medium)
                        .padding(8)
                        .background(Color("DevaubanGreen"))
                        .cornerRadius(8)
                }
                
            }.padding([.all], 8)
                .frame(height: 72)
                .frame(minWidth:360)
                .background(Color("lightGray"))
                .cornerRadius(12)
    }
}


struct ProfileView_Previews: PreviewProvider {
    //static let worker = Worker.makeMockWorker()
    static let session = SessionStore()
    
    static var previews: some View {
        ProfileView().environmentObject(session)
    }
}
