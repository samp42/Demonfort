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
    //var didChange = PassthroughSubject<SessionStore, Never>() ------>>>> this line seems to make login crash..
    
    @Published var session: User?
    @Published var worker: Worker?
    var handle: AuthStateDidChangeListenerHandle?
    
    let database = Firestore.firestore()
    let firebaseAuth = Auth.auth()
    
//    func getUserName(user: User) -> String?{
//        
//        //check if there is user logged in (user exists)
//        if firebaseAuth.currentUser != nil{
//            //find the name of the user from the workers collection
//            
//            return fetchName(email: user.email!){ name in return name }
//        }
//        
//        return nil
//    }
    
    // MARK: - Methods
    
    func setWorker(email: String) {
        WorkerRepository.getWorker(withEmail: email){result in
            //fetch the current user
            switch(result){
                case .success(let worker_):
                    self.worker = worker_
                case .failure(_):
                    // worker probably does not exist if it fails
                    // worker is nil
                    self.worker = nil
            }
        }
    }
    
    func listen(){
        handle = firebaseAuth.addStateDidChangeListener({ (auth, user) in
            if let user = user{
                self.session = User(uid: user.uid, email: user.email)
                self.setWorker(email: user.email!)
            } else{
                self.session = nil
            }
        })
    }
    
    func signUp(employee: String, email: String, password: String, handler: @escaping AuthDataResultCallback){
        //Sign Up use with firebase Auth
        firebaseAuth.createUser(withEmail: email, password: password, completion: handler)
        //add user to workers collection
        /*---------------------FOR SOME REASON THIS IS NOT PUT INTO DOCUMENT WHEN CREATING USER------------------------*/
        /*probably because of firestore rules*/
        //received role but not name
        WorkerRepository.sendUser(email: email, employee: employee, role: .worker)
//        let workerRepo = WorkerRepository()
        //workerRepo.sendUserWorkPlaces(email: email, workPlaces: locations)
        //setWorker(email: email)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback){
        //Authenticate user in Firebase
        firebaseAuth.signIn(withEmail: email, password: password, completion: handler)
        //Create worker instance
        setWorker(email: email)
    }
    
    func signOut(){
        do {
            try firebaseAuth.signOut()
            self.session = nil
        } catch let signOutError as NSError{
            print(signOutError)
            //SEND ALERT TO USER
        }
    }
    
    func sendResetPassword(email: String){
        firebaseAuth.sendPasswordReset(withEmail: email, completion: nil)
    }
    
    func deleteAccount(){
        firebaseAuth.currentUser!.delete(completion: nil)
    }
    
    func unbind(){
        if let handle = handle{
            firebaseAuth.removeStateDidChangeListener(handle)
        }
    }
    
    deinit{
        unbind()
    }
}


