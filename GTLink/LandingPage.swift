//
//  LandingPage.swift
//  GTLink
//
//  Created by Daniel Yu on 10/25/22.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        let layer0 = LinearGradient(colors: [.cyan, .blue, .blue], startPoint: .leading, endPoint: .trailing)
        VStack {
            HStack {
                Image("Logo")
                Text("GTLink")
                    .font(.system(size: 60))
                    
                    .offset(x: -20)
                    .bold()
            }.padding(30)
            
            .offset(y: 50)
            Spacer()
                .frame(height: 160)
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
                .frame(height: 250)
            NavigationLink(destination: FeedScreen()) {
                HStack {
                    Text("  ")
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                    Image("GT")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    Text("Georgia Tech SSO   ")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .bold()
                    Label("", systemImage: "arrow.right")
                        .frame(width: 25, height: 25)
                    Text("  ")
                }
                .background(layer0)
                .cornerRadius(20)
                .frame(height: 80)
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
