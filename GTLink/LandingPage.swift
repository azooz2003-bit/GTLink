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
                .frame(height:170)
            
            Text("❖ Create/Join Project Teams")
                .padding(10)
                .offset(x: 0)
                .foregroundColor(.black)
                .font(.system(size: 20))
            
            Text("➠ Form Study Groups")
                .padding(10)
                .foregroundColor(.black)
                .font(.system(size: 20))
                .offset(x: -25)
            
            Text("↹ Connect with Students")
                .padding(10)
                .foregroundColor(.black)
                .font(.system(size: 20))
                .offset(x: -12)
            
            Spacer()
            NavigationLink(destination: FeedScreen()) {
                HStack {
                    Image("GT")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Georgia Tech SSO ➩  ")
                        .foregroundColor(.white)
                        .font(.custom(
                            "AmericanTypewriter",
                            fixedSize: 25))
                }
                .background(Color.black)
                .cornerRadius(15)
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
