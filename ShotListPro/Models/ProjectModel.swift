//
//  ProjectModel.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/21/20.
//

import UIKit

class Project {
    
    var projectTitle: String
    var clientName: String
    var projectDeadline: Date
    var projectColor: String
    var projectNotes: String
    
    //ignore these ones
    var numberOfVariablesToIgnore = 5
    var projectCreatedAt = Date()
    var projectCreator: String
    var projectID: String
    var projectShots: Int
    
    init(projectTitle: String, clientName: String, projectDeadline: Date, projectColor: String, projectCreator: String, projectID: String = UUID().uuidString, projectShots: Int, projectNotes : String) {
        
        self.projectTitle = projectTitle
        self.clientName = clientName
        self.projectDeadline = projectDeadline
        self.projectColor = projectColor
        self.projectCreator = projectCreator
        self.projectID = projectID
        self.projectShots = projectShots
        self.projectNotes = projectNotes
    }
}

extension Project: Equatable {
    static func == (lhs: Project, rhs: Project) -> Bool {
        return lhs.projectID == rhs.projectID
    }
}

