//
//  GTLinkApp.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 10/8/22.
//


import SwiftUI
import FirebaseCore // Install Firebase SDK with Xcode for this to import correctly

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct GTLinkApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SignOutTest()
        }
    }
}
