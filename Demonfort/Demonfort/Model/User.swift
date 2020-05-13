//
//  User.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import Firebase
import Combine

class SessionStore: ObservableObject{
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    
    init(){
        print("SessionStore initialized")
    }
    
    func listen(){
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user{
                self.session = User(uid: user.uid, email: user.email)
            } else{
                self.session = nil
            }
        })
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback){
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback){
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
            self.session = nil
        } catch {
            print("Error signing out")
            //SEND ALERT TO USER
        }
    }
    
    func unbind(){
        if let handle = handle{
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit{
        unbind()
    }
}

struct User{
    var uid: String
    var email: String?
    
    
    init(uid: String, email: String?){
        self.uid = uid
        self.email = email
    }
}
