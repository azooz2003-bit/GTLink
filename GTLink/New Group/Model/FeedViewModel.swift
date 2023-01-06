//
//  FeedViewModel.swift
//  GTLink
//
//  Created by Nicholas Candello on 11/6/22.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI


// NOTE: Feel free to create helper functions etc. ASK if you're unsure of anything instruction-wise or implementation-wise!

class FeedViewModel: ObservableObject {
    @Published var userVM: UserViewModel //
    
    @Published var allPostings: [Post]?
    @Published var filteredPostings: [Post]?
    private let db = Firestore.firestore()
    // Filtering stuff
    @Published var showFilterSheet = false // make this work
    @Published var selectedTags: [Tags] = []
    @Published var selectedType: Post_Type = .project
    
    
    //Firebase storage reference
    let storage = Storage.storage()
    var storedImageRef: String = ""
    
    init(userVM: UserViewModel, postings: [Post]? = nil) {
        self.userVM = userVM
        self.allPostings = postings
    }
    
    /**
     This function will create a new post, store the received data in a Post object. FYI, the members array in the Post object should only include the owner. Be sure to add this Posting to the Postings collection in Firestore with the given data, go to the Notion document to see how the data is modeled in that collection Firestore. Within this function you will also call the createPosting function to handle the user side of things in the UserViewModel. Take the document ID that's created once you make a document in the Postings collection, and pass it into the function in the userViewModel.
     REMINDER to also use completion handlers.
     
     */
    func createPosting(title: String, date: Date, description: String, type: String, tags: [Tags], image: UIImage, completion: @escaping (Bool) -> Void) {
        
        let docID = db.collection("postings").document().documentID
        
        //Convert tags to Dictionary of Strings and Bools
        uploadToRef(docID: docID, image: image) { success in
            if success {
                var tagDict: [String : Bool] = [:]
                
                for i in 0..<Tags.allCases.count {
                    let currentTag = Tags.allCases[i]
                    tagDict[currentTag.rawValue] = tags.contains(currentTag)
                }
                
                //guard statement to make sure all tags cases are added to the dictionary
                
                if(tagDict.count != Tags.allCases.count) {
                    completion(false)
                }
                
                //Create the post
                
                
                let newPost: [String : Any] = [
                    "title": title,
                    "owner": self.userVM.uuid!,
                    "date":  date,
                    "description": description,
                    "tags": tagDict,
                    "isProject": (type == "Project"),
                    "isStudy": (type == "Study"),
                    "members": [self.userVM.user!.userID]
                ]
                
                
                let newDoc = Firestore.firestore().collection("postings").document(docID)
                
                newDoc.setData(newPost, merge: true) { err in
                    if let err = err {
                        print("Error: \(err)")
                        completion(false)
                    } else {
                        self.userVM.createPosting(postID: newDoc.documentID, completion: { doc in
                            completion(true)
                        })
                    }
                    
                    
                    
                    
                }
            } else {
                completion(false)
            }
        }
    }
    
    
    
    /**
     This function will edit an existing post, use the posting ID given to access the posting's document in Firestore and change the data associated with it with the one's in the parameter. Within this function you will also call the editPosting function in the UserViewModel to handle the user side of things.
     REMINDER to also use completion handlers.
     */
    func editPosting(postingID: String, title: String, date: Date, description: String, isProject: Bool, isStudy: Bool, tags: [String : Bool], receivedRequests: [String : [String : Bool]], completion: @escaping (Bool) -> Void) {

        let posting = self.db.collection("postings").document(postingID)
        posting.updateData(["title": title, "date": Timestamp(date: date), "description": description, "isProject": isProject, "isStudy": isStudy, "tags": tags, "receivedRequests" : receivedRequests]) { (error) in
            if (error == nil) {
                print("Updated Posting")
                //self.userVM!.editPosting()
                completion(true)
            } else {
                print("Failed to Update Posting")
                completion(false)
            }
        }
        
    }
    
    /**
     Creates a request to join a specified posting/project. Look at the Notion database table, helps you understand what you should change, etc. Within this function you will also call the sendRequest function in the UserViewModel to handle the user side of things.
     */
    func requestToJoinProject(posting: Post, completion: @escaping (Bool) -> Void) {
        userVM.sendRequest(postID: posting.id) { success in
            if (success) {
                print("sendRequest func is success")
                posting.receivedRequests[self.userVM.uuid!] = ["accepted" : false, "rejected" : false]
                self.editPosting(postingID: posting.id, title: posting.title, date: posting.date, description: posting.description, isProject: posting.isProject, isStudy: posting.isStudy, tags: DataConversion.tagsToString(tags: posting.tags), receivedRequests: posting.receivedRequests) { success in
                    completion(success)
                }
            } else {
                print("Failed to add to receivedRequests.")
            }
        }
    }
    
    
    /*
     Responds to a particular request with an accept or decline. Updates things from the sender's side of things only.
     Notes:
     - Handles the errors using completion handlers and the Error enum (Google may help with that).
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS METHOD AS YOU LIKE
     */
    func updateRequests(postingID: String, senderID: String, accepted: Bool, rejected: Bool, completion: @escaping (Bool) -> Void) {
        

        getSenderRequests(postingID: postingID, senderID: senderID) { success, sentReq in
            if (success) {
                var sentRequests = sentReq
                sentRequests[postingID] = ["accepted" : accepted, "rejected" : rejected]
                self.db.collection("users").document(senderID).updateData(["sentRequests" : sentReq]) { (error) in
                    if (error == nil) {
                        print("Updated Posting")
                        completion(true)
                    } else {
                        print("Failed to Update Posting")
                        completion(false)
                    }
                    
                }
            } else {
                completion(false)
            }
            
        }
            
    }
        
    func getSenderRequests(postingID: String, senderID: String, completion: @escaping (Bool, [String : [String : Bool]] ) -> Void) {
        db.collection("users").document(senderID).getDocument { (document, error) in
            
            if (error != nil || document == nil) {
                print("error getting sender reqs")
                completion(false, ["":[:]])
                return
            }
            let data = document?.data()
            completion(true, (data!["sentRequests"] as? [String : [String : Bool]])!)
            
        }
    }
    
    
    /**
     Fetches all the posts in the postings collection from Firestore and stores it in the postings array in this class. Basically make the data available locally. Be sure to call the syncUserData() function in the UserViewModel as well to update the user side of things.
     */
    func syncFeedData(completion: @escaping (Bool) -> Void) {
        print("In Sync")
        
        
        //IMPLLEMENT FILTER LOGIC LATER
        db.collection("postings").getDocuments { (documents, error) in
            if (documents == nil || error != nil) {
                print("Error pre-sync")
                completion(false)
                return
            } else {
                print("Document not nil!")
                // Accordingly, the do/catch is not needed
                //do {
                self.allPostings = documents?.documents.map({ docSnap in // arranges posts as Post objects in the array
                    let docData = docSnap.data()
                    let postingId = docSnap.documentID
                    let title = docData["title"] as? String ?? "empty"
                    let imageURL = docData["image"] as? String ?? "empty"
                    let owner = docData["owner"] as? String ?? "empty" // UserID/uid of whoever created the post
                    let date = (docData["date"] as? Timestamp)?.dateValue() ?? Date() // The Date the Post was created
                    let description = docData["description"] as? String ?? "empty"
                    let tags: [String : Bool] = docData["tags"] as? [String : Bool] ?? ["Beginner" : false]
                    let tagsAsTags = DataConversion.stringToTags(tags: tags)
                    let isProject = docData["isProject"] as? Bool ?? false
                    let isStudy = docData["isStudy"] as? Bool ?? false
                    let members = docData["members"] as? [String] ?? ["empty"] // All the uid/User ID's of the people associated with the Post
                    let receivedRequests = docData["receivedRequests"] as? [String : [String : Bool]] ?? ["none" : ["none" : false]]
                    let post = Post(postingID: postingId, title: title, image: UIImage(), owner: owner, date: date, description: description, tags: tagsAsTags, isProject: isProject, isStudy: isStudy, members: members, receivedRequests: receivedRequests)
                    self.getImageFromStorage(docID: postingId, url: imageURL) { success in
                        completion(success)
                        if !success {
                            return
                        }
                    }
                    return post
                })
                
                
                completion(true)
            }
            
            //} catch {
            //    print("SYNC ERROR: \(error)")
            //    completion(false)
            //}
        }
    }
    
    
    //upload image to storage
    
    func uploadToRef(docID: String, image: UIImage, completion: @escaping (Bool) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let refID = "postImages/\(docID)"
        let ref = storage.reference(withPath: refID)
        ref.putData(imageData) { metadata, error in
            if let error = error {
                completion(false)
                print("Image not uploaded: " + error.localizedDescription)
                return
            } else {
                ref.downloadURL { url, error in
                    if let error = error {
                        completion(false)
                        print("Image not uploaded: " + error.localizedDescription)
                        return
                    } else {
                        self.uploadToDB(docID: docID, url: url!.absoluteString) { success in
                            completion(success)
                        }
                    }
                }
            }
        }
    }
    
    func uploadToDB(docID: String, url: String, completion: @escaping (Bool) -> Void) {
        Firestore.firestore().collection("postings").document(docID).setData(["image" : url], merge: true) { error in
            if let error = error {
                completion(false)
                print("Image not uploaded: " + error.localizedDescription)
                return
            } else {
                completion(true)
            }
        }
    }
    
    //download image from storage
    
    func downloadImageURL(docID: String, completion: @escaping (Bool) -> Void) {
        Firestore.firestore().document(docID).getDocument { document, error in
            if let error = error {
                completion(false)
                print("Image not received: " + error.localizedDescription)
                return
            } else {
                let data = document?.data()
                let url = data!["image"] as! String
                if !url.contains("postImages") {
                    completion(false)
                    return
                } else {
                    self.getImageFromStorage(docID: docID, url: url) { success in
                        completion(success)
                    }
                }
                
            }
        }
    }
    func getImageFromStorage(docID: String, url: String, completion: @escaping (Bool) -> Void) {
        storage.reference(forURL: url).getData(maxSize: 1*1500*1500) { data, error in
            if let error = error {
                completion(false)
                print("Image not found in storage: " + error.localizedDescription)
                return
            } else {
                let index = self.allPostings?.firstIndex(where: { post in
                    post.id == docID
                })
                
                if index == -1 {
                    completion(false)
                    return
                }
                
                self.allPostings?[index!].image = UIImage(data: data!)!
                completion(true)
            }
        }
        
    }
}
