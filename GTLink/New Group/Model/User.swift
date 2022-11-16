//
//  User.swift
//  GTLink
//
//  Created by InglouriousBasterd on 11/10/22.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Firebase
import SwiftUI

struct User: Codable {
    var bio: String // Description
    var contact: [String: String] // Map for i.e. "discord": Someone's Discord IGN
    var interests: [String]
    var link: String
    var major: String
    var minor: String
    var name: String
    var received: [String]
    var sentRequests: [String: [String: Bool]] // UserID: ["accepted": true/false, "rejected": true/false]. Both are included because if one of them changes, we know the user responded. If they are both false, we know the user hasn't responded to the request.
    var projects: [String]
    var userID: String
    var year: String // Current year i.e. freshman/first-year, sophomore/second-year, etc. Formatting depends on what we'll use.
    
    init(bio: String, contact: [String : String], interests: [String], link: String, major: String, minor: String, name: String, received: [String], sentRequests: [String : [String : Bool]], userID: String, year: String, projects: [String]) {
        self.bio = bio
        self.contact = contact
        self.interests = interests
        self.link = link
        self.major = major
        self.minor = minor
        self.name = name
        self.received = received
        self.sentRequests = sentRequests
        self.userID = userID
        self.year = year
        self.projects = projects
    }
}
