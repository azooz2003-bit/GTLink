//
//  ContentView.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 10/8/22.
//

import SwiftUI

struct Profilev1: View {
    var body: some View {
        
        // Welcome message
        VStack {
            Text("Welcome, @gburdell!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 75.0)
            
            // Intro
            VStack(alignment: .leading) {
                Text("Let's start with the basics.")
                    .font(.title)
                (Text("*").foregroundColor(.red) + Text(" indicates a required field"))
                    .fontWeight(.light)
            }
            
            // Full name
            VStack(alignment: .leading) {
                (Text("Full Name ") +    Text("*").foregroundColor(.red))
                    .font(.title3)
                    .padding(.top, 30.0)
                    .fontWeight(.light)
                TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(height: 30)
                    .overlay(RoundedRectangle(cornerRadius: 5) .stroke(Color.gray) )
                    .padding(.top, -10)
            }
            .frame(width: 310)
            
            // Description
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.title3)
                    .padding(.top, 30.0)
                    .fontWeight(.light)
                TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 5) .stroke(Color.gray) )
                    .padding(.top, -10)
            }
            .frame(width: 310)
            .padding(.bottom, 100)
            
            // Next button
            Button("Next") {
                print("Next button clicked.")
            }
                .frame(width: 120, height: 50)
                .foregroundColor(Color.black)
                .overlay(RoundedRectangle(cornerRadius: 25) .stroke(Color.black) )
        }
        
    }
}

struct Profilev1_Previews: PreviewProvider {
    static var previews: some View {
        Profilev1()
    }
}
