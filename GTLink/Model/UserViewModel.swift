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

class UserViewMode: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticating: Bool = false
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    var uuid: String? {
        auth.currentUser?.uid
    }
    
    var userIsAuthenticated: Bool {
        auth.currentUser != nil
    }
    
    var userIsAuthenticatedAndSynced: Bool {
        user != nil && userIsAuthenticated
    }
    
    var provider = OAuthProvider(providerID: "microsoft.com");
    let kGraphURI = "https://graph.microsoft.com/v1.0/me/";
    // provider.customParameters = ["tenant": "9089e228-c3ec-4434-9cdb-ecc7d3e21270"]; // Correct one?
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error Signing Out: %@", signOutError)
        }
    }
    
    func loginByMicrosoft(_ sender: Any) {
        isAuthenticating = true
        
        provider.getCredentialWith(_: nil) {credential, error in
            if error != nil {
                self.isAuthenticating = false
            }
            let microCredential = authResult.credential as! OAuthCredential
            let token = microCredential.accessToken!
        }
    }
}
