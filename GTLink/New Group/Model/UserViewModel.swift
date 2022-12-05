//
//  UserViewModel.swift
//  GTLink
//
//  Created by InglouriousBasterd on 10/25/22.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

/*
 NOTE:
 Some functions here may be called inside other functions here as they may be related, keep not of that as you code. Ex: We will probably call the sync function when logging in (if the user already existed) to get all the user's data.
 */

class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticating: Bool = false
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    var provider: OAuthProvider? = nil
    
    var uuid: String? {
        auth.currentUser?.uid
    }
    
    var userIsAuthenticated: Bool {
        auth.currentUser != nil
    }
    
    var userIsAuthenticatedAndSynced: Bool {
        user != nil && userIsAuthenticated
    }
    
    func initialize() {
        self.provider = OAuthProvider(providerID: "microsoft.com")
        self.provider?.customParameters = [
            "tenant": "482198bb-ae7b-4b25-8b7a-6d7f32faa083"
        ];
    }
    
    /*
     Logs the user in using their outlook credentials.
     Notes:
     - Checks for whether the user exists in the database (i.e logged into the app before), this can be done by checking if the logged in user had a "document" in the "users" collection in Firestore with the uid that belongs to the user.
     - Handles the errors using completion handlers and the Error enum (Google may help with how to do that). Don't worry about the Error enum for now though, pretend it doesnt exist.
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false), and a final parameter specifying whether the user existed in the database previously.
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS FUNCTION AS YOU LIKE
     */
    func loginWithProvider(completion: @escaping (Bool) -> Void) {
        self.initialize()
        print("Login with provider")
        self.isAuthenticating = true
        self.provider?.getCredentialWith(nil) { credential, error in
            if error != nil {
                print("A failure occurred")
                self.isAuthenticating = false
                completion(false)
            }
            if credential != nil {
                print("Credential loading")
                self.auth.signIn(with: credential!) { (authResult, error) in
                    guard let credential = authResult?.credential else {
                        print(error?.localizedDescription ?? "A failure occurs in Microsoft sign in.")
                        self.isAuthenticating = false
                        completion(false)
                        return
                    }

                    guard let uid = self.uuid else {
                        completion(false)
                        return
                    }
                    print("User ID: " + uid)

                    //let docRef = self.db.collection("users").document(uid)
                    //print(docRef)
                    
                    self.postLoginSync { success in
                        completion(success)
                    }
                    
                    
                     /*self.syncUserData() { authResult in
                         print("Successfully logged in")
                         print(credential)
                         completion(authResult)
                         self.isAuthenticating = false
                     }*/
                }
            }
        }
    }
    
    func postLoginSync(completion: @escaping (Bool) -> Void) {
        let docRef = self.db.collection("users").document(uuid!)

        docRef.getDocument { (document, error) in
            if document != nil && error == nil {
                if document!.exists { // UserID is in the database
                    print("He Exists")
                    self.syncUserData() { authResult in
                        print("Successfully logged in")
                        //print(credential)
                        completion(authResult)
                        self.isAuthenticating = false
                    }
                } else {
                    // "Document does not exist", or this userID is not added to the database, so we have to add it
                    completion(true)
                    print("Doc doesnt exist.")
                    
                }
                self.isAuthenticating = false
            } else {
                print("A Failure Occurred when getting document")
                self.isAuthenticating = false
                completion(false)
                return                        }
        }
    }

    /*
     IF the user HAS previously logged in, it fetches all the user's data from the Firestore Database, and initializes the user variable above with a User object containing the data. You have to get the document that has the title of (uuid) and deal with the data's document by storing all the data in the user object.
     Notes:
     - Handles the errors using completion handlers and the Error enum (Google may help with how to do that). Don't worry about the Error enum for now though, pretend it doesnt exist.
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS METHOD AS YOU LIKE
     */
    func syncUserData(completion: @escaping (Bool) -> Void) {
        print("In Sync")
        if !userIsAuthenticated {
            print("pre-sync abort")
            completion(false)
            return
        }
        db.collection("users").document(self.uuid!).getDocument { (document, error) in
            if (document == nil || error != nil) {
                print("Error pre-sync")
                completion(false)
                return
            }
            
            print("Document not nil!")
            // Accordingly, the do/catch is not needed
            //do {
            let data = document!.data()
            if let data = data {
                self.assignUserDataLocally(data: data) { success in
                    if (success) {
                        print("Sync Works")
                        completion(true)
                    }
                }
            }
            
            completion(true)
            //} catch {
            //    print("SYNC ERROR: \(error)")
            //    completion(false)
            //}
        }
    }
    
    /*
     Adds or edits the user's profile data in the Firebase Firestore database based on changes made to the profile using the frontend. Once this is called all data fields should be updated locally (in the user object), make the changes on Firestore.
     Notes:
     - Handles the errors using completion handlers and the Error enum (Google may help with that).
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS METHOD AS YOU LIKE
     */
    func addProfileData(completion: @escaping (Bool) -> Void) {
        if !userIsAuthenticated {
            print("pre-add abort")
            completion(false)
            return
        }
        let _ = db.collection("users").document(self.uuid!).setData(["pfpDecoded" : (self.user?.pfpDecoded)! ,"bio": (self.user?.bio)!, "contact": (self.user?.contact)!, "interests": (self.user?.interests)!, "link": (self.user?.link)!, "major": (self.user?.major)!, "minor": (self.user?.minor)!, "name": (self.user?.name)!, "sentRequests": (self.user?.sentRequests)!, "userID": (self.user?.userID)!, "year": (self.user?.year)!])
        print("Add Profile Data Works")
        completion(true)
    }
    
    
    func assignUserDataLocally(data: [String : Any]?, completion: @escaping (Bool) -> Void) {
        // Need default values for Strings in arrays/dictionaries, so we'll just put "None" for now
        if (data != nil) {
            self.user = User(pfpDecoded: data?["pfpDecoded"] as? Data ?? Data(), bio: data?["bio"] as? String ?? "", contact: data!["contact"] as? [String : String] ?? ["None":"None"], interests: data!["interests"] as? [String] ?? ["None"], link: data!["link"] as? String ?? "", major: data!["major"] as? String ?? "", minor: data!["minor"] as? String ?? "", name: data!["name"] as? String ?? "", sentRequests: data!["sentRequests"] as? [String : [String : Bool]] ?? ["None":["None":false]], userID: uuid!, year: data!["year"] as? String ?? "", projects: data?["projects"] as? [String] ?? [])
            print("Assigned data locally.")
            completion(true)
        } else {
            print("Didn't assign data locally.")
            completion(false)
        }
        
    }
    /*
     Simply signs the user out, when that's done, make sure to reset variables such as user to nil.
     Notes:
     - Handles the errors using completion handlers and the Error enum (Google may help with that).
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS METHOD AS YOU LIKE
     */
    func signOut(completion: @escaping (Bool) -> Void) {
        do {
            try auth.signOut()
            self.user = nil
            print("Signed Out")
            completion(true)
        } catch {
            completion(false)
            print("Error signing out user")
        }
    }
    
    /*
     Creates a post for a project or study group. Will be called by a similar function in the FeedViewModel, so that the request is added to the general Feed as well as the user's profile. Only handle the User side of things.
     Notes:
     - Adds the post's ID (once generated) to the user object (in the appropriate field) and the user's document in Firestore. Hint: addProfileData may be useful with that last part.
     - Handles the errors using completion handlers and the Error enum (Google may help with that).
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS METHOD AS YOU LIKE
     */
    func createPosting(requestID: String, completion: @escaping (Bool) -> Void) {
        if user?.projects.contains(requestID) ?? false { // false if the user object doesnt exist
            user?.projects.append(requestID); // requestID should be renamed "postID", represents the project document's id in the postings collection
            addProfileData { result in
                
            }
            print("Request Created");
            completion(true);
        } else {
            print("Error Creating Request");
            completion(false);
        }
    }
    
    /*
     Edits a posting that exists, make changes to that posting locally and on Firestore. Only handle the User side of things.
     Notes:
     - Handles the errors using completion handlers and the Error enum (Google may help with that).
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS METHOD AS YOU LIKE
     */
    func addMember(postingID: String, newMemberID: String, completion: @escaping (Bool) -> Void)  {
        let doc = db.collection("users").document(newMemberID)
        doc.getDocument { (document, error) in
            print(document!)
            if (document == nil || error != nil) {
                print("Error pre-sync")
                completion(false)
                return
            }
            
            let data = document!.data()
            
            self.updateProjects(newMemberID: newMemberID, postingID: postingID, data: data!) { success in
                completion(success)
            }
            
        }
        
    }
    
    func updateProjects(newMemberID: String, postingID: String,data: [String : Any], completion: @escaping (Bool) -> Void) {
        let doc = db.collection("users").document(newMemberID)
        var projects = data["projects"] as? [String]
        projects!.append(postingID)
        doc.updateData([
            "projects": projects!
        ]) { error in
            if let error = error {
                print("Error updating document: \(error)")
                completion(false)
            } else {
                print("Successful Update")
                self.addProfileData { success in
                    if success {
                        self.syncUserData { success2 in
                            if success2 {
                                completion(true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    /*
     Fetches all the user's received requests.
     Notes:
     - Handles the errors using completion handlers and the Error enum (Google may help with that).
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS METHOD AS YOU LIKE
     */
    func getRequests() {
        
    }
    
    /*
     Responds to a particular request with an accept or decline. Updates things from the sender side of things as well.
     Notes:
     - Handles the errors using completion handlers and the Error enum (Google may help with that).
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS METHOD AS YOU LIKE
     */
    func updateRequests() {
        
    }
    
    /**
     Creates a request to join a project, only handle the user side of things. You will be given the postID which represents the post's document in the Firestore Postings collection. HINT: change things in the sentRequests array of the user.
     */
    func sendRequest(postID: String) {
        
    }
    
}
