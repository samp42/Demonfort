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

class SessionStore: ObservableObject{
    var didChange = PassthroughSubject<SessionStore, Never>()
    
    @Published var session: User? {didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    //lazy var userName: User? = { return Auth.auth().currentUser }
    
    let database = Firestore.firestore()
    let workerCollection = "workers"
    let worksheetCollection = "worksheets"
    
    init(){
        print("SessionStore initialized")
    }
    
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
        //send email first!!! (creates document)
        sendUserEmail(email: email)
        sendUserName(email: email, employee: employee)
        sendUserRole(email: email, role: .worker)//worker by default
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
    
    //used to send data about user's name
    func sendUserName(email: String, employee: String) -> Void{
        database.collection(workerCollection).document(email).setData(["Name": employee])
    }
    
    //used to send data about user's mail (creates new document with email as documentId)
    func sendUserEmail(email: String) -> Void{
        //creates new empty document
        database.collection(workerCollection).document(email).setData([:])
    }
    
    //used to send data about user's workplaces
    func sendUserWorkPlaces(email: String, workPlaces: [String]) -> Void{
        if(true){
            database.collection(workerCollection).document(email).setData(["Workplaces": workPlaces])
        }
    }
    
    //used to send data about user's role
    func sendUserRole(email: String, role: Role) -> Void{
        let roleString = role.toString()
        database.collection(workerCollection).document(email).setData(["Role": roleString])
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

struct User{
    var uid: String
    var email: String?
    
    
    init(uid: String, email: String?){
        self.uid = uid
        self.email = email
    }
}
