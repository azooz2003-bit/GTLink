//
//  FeedViewModel.swift
//  GTLink
//
//  Created by Nicholas Candello on 11/6/22.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Firebase
import SwiftUI


// NOTE: Feel free to create helper functions etc. ASK if you're unsure of anything instruction-wise or implementation-wise!

class FeedViewModel: ObservableObject {
    @Published var userVM: UserViewModel? //

    @Published var postings: [Post]?
    
    // Filtering stuff
    @Published var showFilterSheet: Bool = false
    @Published var selectedTags: [Tags] = []
    @Published var selectedType: Post_Type = .project
    
    /**
            This function will create a new post, store the received data in a Post object. FYI, the members array in the Post object should only include the owner. Be sure to add this Posting to the Postings collection in Firestore with the given data, go to the Notion document to see how the data is modeled in that collection Firestore. Within this function you will also call the createPosting function to handle the user side of things in the UserViewModel. Take the document ID that's created once you make a document in the Postings collection, and pass it into the function in the userViewModel.
     REMINDER to also use completion handlers.
     
     */
    func createPosting(title: String, date: Date, description: String, type: String, tags: [Tags], image: UIImage, completion: @escaping (Bool) -> Void) {
        
    }
    
    /**
            This function will edit an existing post, use the posting ID given to access the posting's document in Firestore and change the data associated with it with the one's in the parameter. Within this function you will also call the editPosting function in the UserViewModel to handle the user side of things.
     REMINDER to also use completion handlers.
     */
    func editPosting(postingID: String, title: String, date: Date, description: String, type: String, tags: [Tags], image: UIImage, completion: @escaping (Bool) -> Void) {
        
    }
    
    /**
            Creates request to join a specified posting/project. Look at the Notion database table, helps you understand what you should change, etc. Within this function you will also call the sendRequest function in the UserViewModel to handle the user side of things.
     */
    func requestToJoinProject(postingID: String, completion: @escaping (Bool) -> Void) {
        
    }
    
    /**
                Fetches all the posts in the postings collection from Firestore and stores it in the postings array in this class. Basically make the data available locally. Be sure to call the syncUserData() function in the UserViewModel as well to update the user side of things.
     */
    func syncFeedData(completion: @escaping (Bool) -> Void) {
        Firestore.firestore().collection("postings")
            .whereField(selectedType == .project ? "isProject" : "isStudy", isEqualTo: true).getDocuments { querySnapshot, err in
                if let err = err {
                    print("Error: \(err)")
                    return
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        self.postings?.append(
                            Post(
                                title: data["title"] as? String ?? "Title Here",
                                image: data["image"] as? String ?? "Image Here",
                                owner: data["owner"] as? String ?? "Owner Here",
                                date:  data["date"] as? Date ?? Date(),
                                description: data["description"] as? String ?? "Description here",
                                tags: data["tags"] as? [String : Bool] ?? [String : Bool](),
                                isProject: data["isProject"] as? Bool ?? false,
                                isStudy: data["isStudy"] as? Bool ?? false,
                                members: data["members"] as? [String] ?? [String]()
                            )
                            
                        )
                }
                }
            }
        
        
        
    }
    
}
