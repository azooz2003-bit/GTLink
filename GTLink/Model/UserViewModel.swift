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
    
    var provider = OAuthProvider(providerID: "microsoft.com");
    let kGraphURI = "https://graph.microsoft.com/v1.0/me/";
    // provider.customParameters = ["tenant": "9089e228-c3ec-4434-9cdb-ecc7d3e21270"]; // Correct one?
    
    var uuid: String? {
        auth.currentUser?.uid
    }
    
    var userIsAuthenticated: Bool {
        auth.currentUser != nil
    }
    
    var userIsAuthenticatedAndSynced: Bool {
        user != nil && userIsAuthenticated
    }
    
    
    func buttonTapped() { // Somehow be able to call it!
        provider.customParameters = [
            "prompt": "consent",
            "tenant": "482198bb-ae7b-4b25-8b7a-6d7f32faa083"
        ]
        //}
        
        func signOut() {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print("Error Signing Out: %@", signOutError)
            }
        }
        
        func loginByMicrosoft(_ sender: Any, completion: @escaping (Bool) -> Void) {
            isAuthenticating = true
            
            provider.getCredentialWith(_: nil) {credential, error in
                if error != nil {
                    self.isAuthenticating = false
                }
                
                if let credential = credential {
                    Auth.auth().signIn(with: credential) { (authResult, error) in
                        if error != nil {
                            self.isAuthenticating = false
                        }
                        
                        guard let userID = Auth.auth().currentUser else { return } // Get User Info
                        let uid = userID.uid
                        let GTEmail = userID.email
                        
                        guard let authResult = authResult else {
                            print("Couldn't get Graph authResult")
                            return
                        }
                        
                        // get credential and token when login successfully
                        let microCredential = authResult.credential as! OAuthCredential
                        let token = microCredential.accessToken!
                        
                        self?.sync() { result in // Trying to add sync function, though not sure if it's needed; not done yet
                            self?.isAuthenticating = false
                            completion(result)
                        }
                        // use token to call Microsoft Graph API
                        //getGraphContentWithToken(accessToken: token)
                    }
                }
            }
        }
        
        /*func getGraphContentWithToken(accessToken: String) {
            let url = URL(string: kGraphURI)
            var request = URLRequest(url: url!)
            
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    print("Couldn't get graph result: \(error)")
                    return
                }
                
                guard let result = try? JSONSerialization.jsonObject(with: data!, options: []) else {
                    print("Couldn't deserialize result JSON")
                    return
                }
                
                print("Result from Graph: \(result))")
                
            }.resume()
        } // Maybe don't have?*/
        func sync(completion: @escaping (Bool) -> Void) {
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
                    try self.user = document!.data(as: User.self)
                    print(try document!.data(as: User.self))
                    print(self.user)
                    completion(true)
                } catch {
                    print("SYNC ERROR: \(error)")
                    completion(false)
                }
            }
        }
    }// End of ButtonTapped
}
