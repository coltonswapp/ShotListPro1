//
//  ProjectController.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/21/20.
//

import UIKit
import FirebaseFirestore

class ProjectController {
    
    // MARK: - Shared Instance
    static let sharedInstance = ProjectController()
    
    // MARK: - Source of Truth
    var projects: [Project] = []
    
    // MARK: - Database Ref
    let db = Firestore.firestore()
    
    // MARK: - Crud Functions
    
    // ADDING/CREATING A PROJECT
    func createProject(projectDict: [String : Any]) {
        print(projectDict)
        let projectToAdd = db.collection("projects").document(projectDict["projectID"] as? String ?? "")
        projectToAdd.setData(projectDict)
        //projects.append(project)
    }
    
    // FETCH PROJECTS -- For now, fetching all. Eventually, to fetch all projects whos' "projectCreator" field matches the current user's UserID. As well as all projects whos' "collaborators" array contains the currentUser's UserID.
    func fetchAllProjects(completion: @escaping (Bool) -> Void) {
        db.collection("projects").addSnapshotListener { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(false)
            }
            self.projects.removeAll()
            if let snapshot = snapshot {
                for doc in snapshot.documents {
                    
                    let projectData = doc.data()
                    let projectTitle = projectData["projectTitle"] as? String ?? ""
                    let client = projectData["clientName"] as? String ?? ""
                    let projectDeadline: Date = Timestamp.dateValue(projectData["projectDeadline"] as! Timestamp)()
                    let projectColor = projectData["projectColor"] as? String ?? ""
                    let projectCreator = projectData["projectCreator"] as? String ?? ""
                    let projectID = projectData["projectID"] as? String ?? ""
                    
                    let project = Project(projectTitle: projectTitle, clientName: client, projectDeadline: projectDeadline, projectColor: projectColor, projectCreator: projectCreator, projectID: projectID)
                    
                    ProjectController.sharedInstance.projects.append(project)
                }
                completion(true)
            }
        }
    }
    
    // EDITING/UPDATING A PROJECT
    func updateProject(project: Project?) {
        guard let projectToUpdate = project else { return }
        db.collection("projects").document(projectToUpdate.projectID).setData(["projectTitle": projectToUpdate.projectTitle,
                                                                       "client": projectToUpdate.clientName,
                                                                       "projectDeadline": projectToUpdate.projectDeadline,
                                                                       "projectColor": projectToUpdate.projectColor], merge: true)
    }
    
    // DELETING A PROJECT
    func deleteProject(project: Project?) {
        guard let projectToDelete = project else { return }
        db.collection("projects").document(projectToDelete.projectID).delete()
        guard let index = ProjectController.sharedInstance.projects.firstIndex(of: projectToDelete) else { return }
        projects.remove(at: index)
        print("\(projectToDelete.projectTitle) with ID \(projectToDelete.projectID) was successfully deleted from the database.")
    }
    
    
}
