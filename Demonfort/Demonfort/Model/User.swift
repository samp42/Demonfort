//
//  User.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import Firebase
import FirebaseAuth
import Combine

struct User{
    var uid: String
    var email: String?
    
    
    init(uid: String, email: String?){
        self.uid = uid
        self.email = email
    }
}

public class SessionStore: ObservableObject{
    var didChange = PassthroughSubject<SessionStore, Never>()
    
    @Published var session: User? //{didSet {self.didChange.send(self)}}
    @Published var worker: Worker?
    var handle: AuthStateDidChangeListenerHandle?
    //lazy var userName: User? = { return Auth.auth().currentUser }
    
    let database = Firestore.firestore()
    
    init(){}
    
//    func getUserName(user: User) -> String?{
//        
//        //check if there is user logged in (user exists)
//        if Auth.auth().currentUser != nil{
//            //find the name of the user from the workers collection
//            
//            return fetchName(email: user.email!){ name in return name }
//        }
//        
//        return nil
//    }
    
    func setWorker(){
        
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
    
    func signUp(employee: String, email: String, password: String, handler: @escaping AuthDataResultCallback){
        //Sign Up use with firebase Auth
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        //add user to workers collection

        /*---------------------FOR SOME REASON THIS IS NOT PUT INTO DOCUMENT WHEN CREATING USER------------------------*/
        /*probably because of firestore rules*/
        //received role but not name
        WorkerRepository.sendUser(email: email, employee: employee, role: .worker)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback){
        //Authenticate user in Firebase
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        //Create worker instance
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
    
    func sendResetPassword(email: String){
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
    }
    
    func deleteAccount(){
        Auth.auth().currentUser!.delete(completion: nil)
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


