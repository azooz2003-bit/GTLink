//
//  CreateProfile1.swift
//  GTLink
//
//  Created by Ria Patel on 11/1/22.
//

import SwiftUI

struct CreateProfile1: View {
    var body: some View {
        VStack (alignment: .center){
            Spacer()
            Text("Welcome to GTLink!")
                .font(.system(size: 36))
                .fontWeight(.bold)
                .padding()
                .padding(.bottom, 20)
            Image("undraw_engineering_team_a7n2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350)
                .padding()
            
            Text("Before we get started, let’s set up your profile with basic information about you and your interests.")
                .font(.system(size: 20))
                .padding(.horizontal,31)
                .padding(.top, 40)
            Spacer()
            Button(action: {}){
                Text("Start")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    
            }
            .padding(.horizontal, 133)
            .padding(.vertical, 10)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.init(red: 71 / 255, green: 103 / 255, blue: 204 / 255), Color.init(red: 90 / 255, green: 186 / 255, blue: 255 / 255)]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(10)
            
        }
    }
}

struct CreateProfile1_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfile1()
    }
}
