//
//  ShotController.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/24/20.
//

import UIKit
import FirebaseFirestore

class ShotController {
    
    // MARK: - Shared Instance
    static let sharedInstance = ShotController()
    
    // MARK: - Source of Truth
    var shots: [Shot] = []
    
    // MARK: - Properties
//    var user: User? = UserController.sharedInstance.currentUser
    
    // MARK: - Database Ref
    let db = Firestore.firestore()
    
    // MARK: - Crud Functions
    
    // ADDING / CREATING A SHOT
    func createShot(to project: Project, shotDict: [String : Any]) {
        
        print(shotDict)
//        let shotToAdd = db.collection("projects").document(project.projectID).collection("shots").document(shotDic)
    }
    
    
}
