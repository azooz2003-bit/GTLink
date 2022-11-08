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
    
    var body: some View {
        VStack {
            if userViewModel.userIsAuthenticated == true {
                Button("Signout") {
                    userViewModel.signOut() { success in
                        
                    }
                }
            } else {
                Button("Login with Microsoft") {
                    userViewModel.loginWithProvider()
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
