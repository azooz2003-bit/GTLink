//
//  CreateProfile2.swift
//  GTLink
//
//  Created by River Pease on 11/3/22.
//

import SwiftUI

struct CreateProfile2: View {
    var body: some View {
        
        VStack {
            
            // Back button
            Button(action: {}){
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
            }
            .foregroundColor(Color.black)
            .position(x: 50, y: 20)
            
            // Step 1/4
            Text("Step 1/4")
                .multilineTextAlignment(.leading)
                .font(.system(size: 20))
                .padding(.leading, -160)
            
            // Title
            Text("Let's start with the basics.")
                .multilineTextAlignment(.leading)
                .font(.system(size: 27))
                .bold()
            
            // Image
            Image("background")
                .frame(width: 150, height: 150)
                .padding(.vertical, 30)
            
            // Full Name
            TextField("Full Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 50)
                .padding(.leading, 20)
                .overlay(RoundedRectangle(cornerRadius: 15) .stroke(Color.black) )
                .padding(.vertical, 5)
                
            
            // Username
            TextField("Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 50)
                .padding(.leading, 20)
                .overlay(RoundedRectangle(cornerRadius: 15) .stroke(Color.black) )
                .padding(.vertical, 5)
            
            // Description
            TextField("Description/Bio", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 175)
                .padding(.leading, 20)
                .padding(.bottom, 20)
                .padding(.top, -50)
                .overlay(RoundedRectangle(cornerRadius: 15) .stroke(Color.black) )
                .padding(.vertical, 5)
            
            // Next button
            Button(action: {}){
                Text("Next")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 133)
            .padding(.vertical, 10)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.init(red: 71 / 255, green: 103 / 255, blue: 204 / 255), Color.init(red: 90 / 255, green: 186 / 255, blue: 255 / 255)]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(10)
            .padding(.top, 30)
        }
        
    }
}

struct CreateProfile2_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfile2()
    }
}
