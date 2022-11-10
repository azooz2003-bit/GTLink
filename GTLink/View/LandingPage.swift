//
//  LandingPage.swift
//  GTLink
//
//  Created by Daniel Yu on 10/25/22.
//

import SwiftUI

struct LandingPage: View {
    @State var ssoPressed = false
    
    var body: some View {
        let gradient = LinearGradient(colors: [.cyan, Color("DarkBlue"), Color("DarkBlue")], startPoint: .leading, endPoint: .trailing)
        
        NavigationStack {
            
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
                
                
            }
            
            Spacer()
                .frame(height: 190)
            
            Button(action: {
                
                ssoPressed = true
            }) {
                HStack {
                    
                    Image("GT")
                        .resizable()
                        .aspectRatio(contentMode: .fit).padding(.leading)
                        
                    Text("Georgia Tech SSO   ")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .bold()
                    Label("", systemImage: "arrow.right")
                        .font(Font.system(size: 40)).padding(.trailing).foregroundColor(.white)
                }
                .background(gradient)
                .cornerRadius(20)
                .frame(height: 80)
                .padding(.bottom)
            }
            
          
        }.navigationDestination(isPresented: $ssoPressed, destination: {
            EmptyView()
        })
        
    }

}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
