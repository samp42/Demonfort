//
//  ForgottenPasswordView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-13.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct ForgottenPasswordView: View {
    @State private var email: String = ""
    
    var body: some View {
        VStack{
            Text("Hello, World!")
            TextField("Email", text: $email)
        }.background(Color.black)
    }
}

struct ForgottenPasswordView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForgottenPasswordView()
    }
}
