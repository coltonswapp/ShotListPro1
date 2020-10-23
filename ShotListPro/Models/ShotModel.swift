//
//  ShotModel.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/21/20.
//

import UIKit

class Shot {
    
    var shotTitle: String
    var shotIsComplete: Bool = false
    var shotNotes: String
    var cameraForShot: String
    var lensForShot: String
    
    var shotLength: String
    var shotMood: String
    var numOfShots: String
    var shotSection: String
    var shotID: String
    
    init(shotTitle: String, shotIsComplete: Bool = false, shotNotes: String, cameraForShot: String, lensForShot: String, shotLength: String, shotMood: String, numOfShots: String, shotSection: String, shotID: String = UUID().uuidString) {
        
        self.shotTitle = shotTitle
        self.shotIsComplete = shotIsComplete
        self.shotNotes = shotNotes
        self.cameraForShot = cameraForShot
        self.lensForShot = lensForShot
        self.shotLength = shotLength
        self.shotMood = shotMood
        self.numOfShots = numOfShots
        self.shotSection = shotSection
        self.shotID = shotID
    }
}
extension Shot: Equatable {
    static func == (lhs: Shot, rhs: Shot) -> Bool {
        return lhs.shotID == rhs.shotID
    }
}
