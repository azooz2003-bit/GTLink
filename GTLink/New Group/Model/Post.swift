//
//  Post.swift
//  GTLink
//
//  Created by InglouriousBasterd on 11/3/22.
//

// var title: String, image: String?, owner: uid String, date: Date, description: String, tags: [String: Bool], isProject: bool, isStudy: bool, members: String uid


import Foundation
import SwiftUI

struct Post {
    var postingID: String
    var title: String
    var image: String
    var owner: String // UserID/uid of whoever created the post
    var date: Date // The Date the Post was created
    var description: String
    var tags: [String: Bool] // All Tags and whether or not they are used
    var receivedRequests: [String: [String: Bool]]
    var isProject: Bool
    var isStudy: Bool
    var members: [String] // All the uid/User ID's of the people associated with the Post
    
    init(postingID: String, title: String, image: String, owner: String, date: Date, description: String, tags: [String : Bool], receivedRequests: [String: [String: Bool]], isProject: Bool, isStudy: Bool, members: String) {
        self.postingID = postingID
        self.title = title
        self.image = image
        self.owner = owner
        self.date = date
        self.description = description
        self.tags = tags
        self.receivedRequests = receivedRequests
        self.isProject = isProject
        self.isStudy = isStudy
        self.members = [members]
    }
}
