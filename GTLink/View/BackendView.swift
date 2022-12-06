//
//  BackendView.swift
//  GTLink
//
//  Created by InglouriousBasterd on 12/3/22.
//

// For testing Authentication Stuff!
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import SwiftUI

struct BackendView: View {
    @StateObject var userViewModel = UserViewModel()
    @State var userIsAuthenticatedAndSynced = false;
    @State var errorOccurred = false
    
    var body: some View {
        VStack {
            if userIsAuthenticatedAndSynced == true {
                Button("Signout") {
                    userViewModel.signOut() { success in
                        if success {
                            userIsAuthenticatedAndSynced = false
                        } else {
                            errorOccurred = true
                        }
                    }
                }
                Button("Change Acceptance") {
                    
                }
            } else {
                Button("Login with Microsoft") {
                    userViewModel.loginWithProvider() { success in
                        if success {
                            print("Authenticated")
                            userIsAuthenticatedAndSynced = true
                        } else {
                            print("Not Authenticated")
                            errorOccurred = true
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct BackendView_Previews: PreviewProvider {
    static var previews: some View {
        BackendView()
    }
}
