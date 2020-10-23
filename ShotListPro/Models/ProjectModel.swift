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
    var projectCreator: String
    var projectID: String
    var projectShots: [Shot]
    
    init(projectTitle: String, clientName: String, projectDeadline: Date, projectColor: String, projectCreator: String, projectID: String = UUID().uuidString, projectShots: [Shot] = []) {
        
        self.projectTitle = projectTitle
        self.clientName = clientName
        self.projectDeadline = projectDeadline
        self.projectColor = projectColor
        self.projectCreator = projectCreator
        self.projectID = projectID
        self.projectShots = projectShots
    }
}

extension Project: Equatable {
    static func == (lhs: Project, rhs: Project) -> Bool {
        return lhs.projectID == rhs.projectID
    }
}

