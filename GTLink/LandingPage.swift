//
//  LandingPage.swift
//  GTLink
//
//  Created by Daniel Yu on 10/25/22.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        VStack {
        
            Text("GT Link")
                .font(.system(size: 60))
                .padding(30)
            Spacer()
                .frame(height:180)
            HStack {
                Image("iconOne")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Create/Join Project Teams")
                    .padding(10)
                    .offset(x: 0)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
            }
            HStack {
                Image("iconTwo")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .offset(x: -28)
                
                Text("Form Study Groups")
                    .padding(10)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .offset(x: -27)
            }
            HStack {
                Image("iconThree")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .offset(x: -13)
                Text("Connect with Students")
                    .padding(10)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .offset(x: -20)
            }
            
            Spacer()
            NavigationLink(destination: FeedScreen()) {
                HStack {
                    Text("          ")
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    Image("GT")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    Text("Georgia Tech SSO")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    Image("Right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("          ")
                }
                .background(Color.black)
                .cornerRadius(20)
                .frame(height: 60)
                .padding(-100)
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
