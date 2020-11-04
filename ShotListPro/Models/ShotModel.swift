//
//  ShotModel.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/21/20.
//

import UIKit

class Camera {
    var string = ""
}
class Lens {
    var string = ""
}
class Length {
    var string = ""
}
class Mood {
    var string = ""
}
class Needed {
    var string = ""
}
class Section {
    var string = ""
}

class Shot {
    
    var shotTitle = String()
    var shotNotes = String()
    var cameraUsed = Camera()
    var cameraLens = Lens()
    var shotLength = Length()
    var shotMood = Mood()
    var shotsNeeded = Needed()
    var shotSection = Section()
    
    //variable to ignore
    var numberOfVariablesToIgnore = 4
    var shotIsComplete: Bool = false
    var shotID: String
    var projectId: String
    
    init(shotTitle: String, shotIsComplete: Bool = false, shotNotes: String, cameraForShot: String, lensForShot: String, shotLength: String, shotMood: String, numOfShots: String, shotSection: String, shotID: String = UUID().uuidString, projectId: String) {
        
        self.shotTitle = shotTitle
        self.shotIsComplete = shotIsComplete
        self.shotNotes = shotNotes
        self.cameraUsed.string = cameraForShot
        self.cameraLens.string = lensForShot
        self.shotLength.string = shotLength
        self.shotMood.string = shotMood
        self.shotsNeeded.string = numOfShots
        self.shotSection.string = shotSection
        self.shotID = shotID
        self.projectId = projectId
    }
}
extension Shot: Equatable {
    static func == (lhs: Shot, rhs: Shot) -> Bool {
        return lhs.shotID == rhs.shotID
    }
}
