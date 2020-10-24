//
//  User.swift
//  ShotListPro
//
//  Created by Colton Swapp on 10/24/20.
//

import UIKit

class User {
    
    var name: String
    var email: String
    var userID: String
    var isFTFMember: Bool
    
    init(name: String, email: String, userID: String = UUID().uuidString, isFTFMember: Bool = false) {
        
        self.name = name
        self.email = email
        self.userID = userID
        self.isFTFMember = isFTFMember
        
    }
    
}
