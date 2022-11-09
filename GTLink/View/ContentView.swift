//
//  ContentView.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 10/8/22.
//
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
                            userIsAuthenticatedAndSynced = true
                        } else {
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
