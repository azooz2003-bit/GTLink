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
}
