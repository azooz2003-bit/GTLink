//
//  Post.swift
//  GTLink
//
//  Created by InglouriousBasterd on 11/3/22.
//

// var title: String, image: String?, owner: uid String, date: Date, description: String, tags: [String: Bool], isProject: bool, isStudy: bool, members: String uid


import Foundation
import FirebaseCore
import FirebaseFirestore
import Firebase

import SwiftUI

class Post: Identifiable, Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: String
    var title: String
    var image: UIImage
    let owner: String // UserID/uid of whoever created the post
    let date: Date // The Date the Post was created
    var description: String
    var tags: [Tags: Bool] // All Tags and whether or not they are used
    let isProject: Bool
    let isStudy: Bool
    var members: [String] // All the uid/User ID's of the people associated with the Post
    var receivedRequests: [String : [String : Bool]]
    
    init(postingID: String, title: String, image: UIImage, owner: String, date: Date, description: String, tags: [Tags : Bool], isProject: Bool, isStudy: Bool, members: [String], receivedRequests: [String : [String : Bool]]) {
        self.id = postingID
        self.title = title
        self.image = image
        self.owner = owner
        self.date = date
        self.description = description
        self.tags = tags
        self.isProject = isProject
        self.isStudy = isStudy
        self.members = members
        self.receivedRequests = receivedRequests
    }
}
