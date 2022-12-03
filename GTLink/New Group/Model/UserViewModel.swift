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
                    completion(true)
                    print("Successfully logged in")
                    print(credential)
                }
            }
        }
    }
    func checkUserExists(completion: @escaping (Book) -> Void) {
        
    }
    
    /*
     IF the user HAS previously logged in, it fetches all the user's data from the Firestore Database, and initializes the user variable above with a User object containing the data. You have to get the document that has the title of (uuid) and deal with the data's document by storing all the data in the user object.
     Notes:
     - Handles the errors using completion handlers and the Error enum (Google may help with how to do that). Don't worry about the Error enum for now though, pretend it doesnt exist.
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS METHOD AS YOU LIKE
     */
    func syncUserData(completion: @escaping (Bool) -> Void) {
        if !userIsAuthenticated {
            print("pre-sync abort")
            completion(false)
            return
        }
        db.collection("users").document(self.uuid!).getDocument { (document, error) in
            print(document!)
            if (document == nil || error != nil) {
                print("Error pre-sync")
                completion(false)
                return
            }
                    
            do {
                //try self.user = document!.data(as: User.self)
                //print(try document!.data(as: User.self))
                print(self.user)
                completion(true)
            } catch {
                print("SYNC ERROR: \(error)")
                completion(false)
            }
        }
    }
    
    /*
     Adds or edits the user's profile data in the Firebase Firestore database based on changes made to the profile using the frontend. Once this is called all data fields should be updated locally (in the user object), make the changes on Firestore.
     Notes:
     - Handles the errors using completion handlers and the Error enum (Google may help with that).
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     INCOMPLETE CODE, EDIT THE PARAMETERS OF THIS METHOD AS YOU LIKE
     */
    func addProfileData() {
        if !userIsAuthenticated {
            print("pre-add abort")
            return
        }
        do {
            //let _ = try db.collection("users").document(self.uuid!).setData(from: user!)
        } catch {
                print("Error adding")
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
            addProfileData();
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
    func editPosting() {
        
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
