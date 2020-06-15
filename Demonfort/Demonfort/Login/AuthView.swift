//
//  AuthView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-13.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct AuthView: View {

    var body: some View {
        NavigationView{
            LoginView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        AuthView().environmentObject(session)
    }
}
