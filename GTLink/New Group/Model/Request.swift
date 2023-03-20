//
//  Request.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 1/9/23.
//

import Foundation

class Request: Identifiable {
    var sender: User
    var targetProject: Post
    var accepted: Bool
    var rejected: Bool
    
    init(sender: User, targetProject: Post, accepted: Bool, rejected: Bool) {
        self.sender = sender
        self.targetProject = targetProject
        self.accepted = accepted
        self.rejected = rejected
    }
    
    
}
