//
//  ContentView.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 10/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var test = true;
    @State private var dummy = false;
    var body: some View {
        VStack {
            Text("Settings").font(.system(size: 35, weight: .bold))
            
            Spacer()
            
            Toggle("New Post Notification", isOn: $test).padding(.leading, 45).padding(.trailing, 45).padding(.bottom, 15).tint(.black)
            
            Toggle("Dark Mode", isOn: $dummy).padding(.leading, 45).padding(.trailing, 45).tint(.black)
            
            Spacer()

            
            Button {
            } label: {
                Text("Log Out").foregroundColor(.red).padding().overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.red))
            }.padding(50)
            
        }
    }
    func logOut() {
        dummy = true;
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
