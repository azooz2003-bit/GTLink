//
//  ContentView.swift
//  GTLink
//
//  Created by InglouriousBasterd on 11/15/22.
//

// For testing Authentication Stuff!
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
