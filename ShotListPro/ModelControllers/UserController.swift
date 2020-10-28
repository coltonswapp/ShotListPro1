//
//  UserController.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/28/20.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class UserController {
    
    // MARK: - SharedInstance
    static let sharedInstance = UserController()
    
    // MARK: - Database Ref
    let db = Firestore.firestore()
    
    // MARK: - Current User
    var currentUser: User?
    
    // MARK: - CrudFunctions
    
    // CREATE A USER
    func createUser(name: String, email: String, userID: String, isFTFMember: Bool) {
        let newUser = User(name: name, email: email)
        
        db.collection("users").document(newUser.userID).setData(["name" : newUser.name, "email": newUser.email, "userID": newUser.userID, "isFTFMember": newUser.isFTFMember])
        
        self.currentUser = newUser
    }
    
    func retrieveUser(userId: String, completion: @escaping (Result<User?, Error>) -> Void) {
        
        
        db.collection("users").document(userId).getDocument { (snapshot, error) in
            if let error = error {
                return completion(.failure(LoginError.thrownError(error)))
            }
            
            if let profile = snapshot?.data() {
                // Profile was found, create new user
                let userId = snapshot?.documentID ?? ""
                let email = profile["email"] as? String ?? ""
                let name = profile["name"] as? String ?? ""
                let isFTFMember = profile["isFTFMember"] as? Bool ?? false
                
                
                let user = User(name: name, email: email, userID: userId, isFTFMember: isFTFMember)
                self.currentUser = user
                completion(.success(user))
            }
            
            else {
                return completion(.failure(LoginError.unableToDecode))
            }
        }
    }
    
    
    
}
