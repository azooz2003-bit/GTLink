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
     - Checks for whether the user exists in the database (i.e logged into the app before)
     - Handles the errors using completion handlers and the Error enum (Google may help with that).
     - In addition to the error, the completion handler should also take in the result of the operation (success -> true or failure/error -> false)
     */
    func loginWithProvider() {
        self.initialize()
        print("Login with provider")
        self.isAuthenticating = true
        self.provider?.getCredentialWith(nil) { credential, error in
            if error != nil {
                print("A failure occurred")
                self.isAuthenticating = false
                return
            }
            if credential != nil {
                print("Credential loading")
                self.auth.signIn(with: credential!) { (authResult, error) in
                    guard let credential = authResult?.credential else {
                        print(error?.localizedDescription ?? "A failure occurs in Microsoft sign in.")
                        self.isAuthenticating = false
                        return
                    }
                    print("Successfully logged in")
                    print(credential)
                }
            }
        }
    }
    
    func syncUserData() {
        
    }
    
    func addProfileData() {
        
    }
    
    func signOut() {
        
    }
    
    /*
     Creates a request for a project or study group. Will be called by a similar function in the FeedViewModel, so that the request is added to the general Feed as well as the user's profile.
     Notes:
     - Adds the request's ID (once generated) to the user's profile.
     */
    func createPosting() {
        
    }
    
    func editPosting() {
        
    }
    
    func getRequests() {
        
    }
    
    func updateRequests() {
        
    }
}
