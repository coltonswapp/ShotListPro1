//
//  ShotModel.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/21/20.
//

import UIKit

class Shot {
    
    var shotTitle: String
    var shotNotes: String
    var cameraUsed: String
    var cameraLens: String
    var shotLength: String
    var shotMood: String
    var shotsNeeded: String
    
    //variable to ignore
    var numberOfVariablesToIgnore = 4
    var shotIsComplete: Bool = false
    var shotSection: String
    var shotID: String
    
    init(shotTitle: String, shotIsComplete: Bool = false, shotNotes: String, cameraForShot: String, lensForShot: String, shotLength: String, shotMood: String, numOfShots: String, shotSection: String, shotID: String = UUID().uuidString) {
        
        self.shotTitle = shotTitle
        self.shotIsComplete = shotIsComplete
        self.shotNotes = shotNotes
        self.cameraUsed = cameraForShot
        self.cameraLens = lensForShot
        self.shotLength = shotLength
        self.shotMood = shotMood
        self.shotsNeeded = numOfShots
        self.shotSection = shotSection
        self.shotID = shotID
    }
}
extension Shot: Equatable {
    static func == (lhs: Shot, rhs: Shot) -> Bool {
        return lhs.shotID == rhs.shotID
    }
}
