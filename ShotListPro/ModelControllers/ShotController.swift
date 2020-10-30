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
    static var sharedInstance = ShotController()
    
    // MARK: - Source of Truth
    var shots: [String : [Shot]] = ["" : []]
    
    // MARK: - Properties
//    var user: User? = UserController.sharedInstance.currentUser
    
    // MARK: - Database Ref
    let db = Firestore.firestore()
    
    // MARK: - Crud Functions
    
    // ADDING / CREATING A SHOT
    func createShot(shotDict: [String : Any]) {
        var finalProject = shotDict
        finalProject["projectCreatedAt"] = Date()
        db.collection("projects").document(finalProject["projectId"] as? String ?? "").collection("shots").addDocument(data: finalProject)
    }
    
    func completeShot(projectId : String, shotId : String, bool : Bool) {
        print(projectId, shotId, bool)
        db.collection("projects").document(projectId).collection("shots").document(shotId).setData(["shotIsComplete" : bool], merge: true)
    }
    
    func fetchShotsInProject(_ projectId : String, completion: @escaping (Bool) -> Void) {
        db.collection("projects").document(projectId).collection("shots").order(by: "projectCreatedAt", descending: false).addSnapshotListener { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(false)
            }
            self.shots.removeAll()
            if let snapshot = snapshot {
                for doc in snapshot.documents {
                    
                    let shotData = doc.data()
                    let shotTitle = shotData["shotTitle"] as? String ?? ""
                    let shotIsComplete = shotData["shotIsComplete"] as? Bool ?? false
                    let shotNotes = shotData["shotNotes"] as? String ?? ""
                    let cameraForShot = shotData["cameraUsed"] as? String ?? ""
                    let lensForShot = shotData["cameraLens"] as? String ?? ""
                    let shotLength = shotData["shotLength"] as? String ?? ""
                    let shotMood = shotData["shotMood"] as? String ?? ""
                    let numOfShots = shotData["shotsNeeded"] as? String ?? ""
                    let shotSection = shotData["shotSection"] as? String ?? ""
                    let shotId = doc.documentID

                    
                    let shot = Shot(shotTitle: shotTitle, shotIsComplete: shotIsComplete, shotNotes: shotNotes, cameraForShot: cameraForShot, lensForShot: lensForShot, shotLength: shotLength, shotMood: shotMood, numOfShots: numOfShots, shotSection: shotSection, shotID: shotId)
                    
                    if ShotController.sharedInstance.shots[projectId] != nil {
                        ShotController.sharedInstance.shots[projectId]!.append(shot)
                    } else {
                        ShotController.sharedInstance.shots[projectId] = [shot]
                    }
                }
                completion(true)
            }
        }
    }
    
    
}
