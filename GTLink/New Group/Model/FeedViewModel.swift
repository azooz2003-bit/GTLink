//
//  FeedViewModel.swift
//  GTLink
//
//  Created by Nicholas Candello on 10/27/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FeedViewModel: ObservableObject {
    
    private let db = Firestore.firestore()
    
    @StateObject var userViewModel = UserViewModel() // Once UserViewModel class shows up
    
    @Published var viewMode: String = "Default Mode" // will be a UserViewMode object later
    @Published var allPosts: [String] = [] // will be an array of Post objects later
    
    
//    Create a class in a new file in the Model folder called FeedViewModel.
//
//    Make sure it has an instance variable that stores some instance of the UserViewMode class. We need this to be able to handle user interactions with any post.
//    This class will handle database operations related to projects in the feed.
//    Functions include but are not limited to:
//    sync(), fetches new projects and data regarding the feed from the database (Firestore).
//    add(), adds new projects to feed (in the database). Also adds the project to the current user's list of projects.
    
    // fetches new projects and data regarding the feed from the database (Firestore).
    func sync() {
        
    }
    
    
    // adds new projects to feed (in the database). Also adds the project to the current user's list of projects.
    func add() {
        
    }
    
    
}
