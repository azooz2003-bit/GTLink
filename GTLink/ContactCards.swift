//
//  ContactCards.swift
//  GTLink
//
//  Created by River Pease on 11/3/22.
//

import SwiftUI

struct ContactCards: View {
    
    @State private var didTapEmail:Bool = false
    @State private var didTapPhone:Bool = false
    @State private var didTapDiscord:Bool = false
    @State private var didTapGroupMe:Bool = false
    
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
            Text("Step 4/4")
                .font(.system(size: 20))
                .padding(.leading, -160)
                .position(x: 198, y:0)
            
            // Title
            Text("Add some ways for people to connect with you and star your favorite.")
                .font(.system(size: 24))
                .bold()
                .fixedSize(horizontal: false, vertical: true)
                .position(x: 135)
                .frame(width: 300)
            
            // Contact Cards
            
            // VStack for all content on page
            VStack {
                
                // VStack of Contact Options
                VStack(spacing: 20) {
                    
                    // VStack for Email Card
                    VStack {
                        // HStack for logo, title, and toggle button
                        HStack {
                            Image(systemName: "envelope")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 24)
                            Spacer()
                                .frame(width: 21)
                            Text("Email")
                            Spacer()
                            Button(action: {
                                if ((didTapPhone == false) && (didTapDiscord == false) && (didTapGroupMe == false)) {
                                    didTapEmail.toggle()
                                }
                            }) {
                                if (didTapEmail == true) {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.yellow)
                                } else {
                                    Image(systemName: "star")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.black)
                                }
                            }
                            
                        }
                        
                        TextField("Email Address", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .overlay(
                                Divider()
                                    .frame(height: 1.5)
                                    .overlay(.gray)
                                    .opacity(0.6)
                                    .offset(x: 0, y: 15)
                            )
                        
                    }
                    .padding(.all, 20)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(didTapEmail == true ? .yellow : .black, lineWidth: didTapEmail == true ? 3 : 2))
                    .padding(.horizontal, 30)
                    
                    // VStack for Phone Card
                    VStack {
                        // HStack for logo, title, and toggle button
                        HStack {
                            Image(systemName: "phone")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 24)
                            Spacer()
                                .frame(width: 21)
                            Text("Phone")
                            Spacer()
                            Button(action: {
                                if ((didTapEmail == false) && (didTapDiscord == false) && (didTapGroupMe == false)) {
                                    didTapPhone.toggle()
                                }
                            }) {
                                if (didTapPhone == true) {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.yellow)
                                } else {
                                    Image(systemName: "star")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.black)
                                }
                            }
                            
                        }
                        
                        TextField("Phone Number", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .overlay(
                                Divider()
                                    .frame(height: 1.5)
                                    .overlay(.gray)
                                    .opacity(0.6)
                                    .offset(x: 0, y: 15)
                            )
                        
                    }
                    .padding(.all, 20)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(didTapPhone == true ? .yellow : .black, lineWidth: didTapPhone == true ? 3 : 2))
                    .padding(.horizontal, 30)
       
                    // VStack for Discord Card
                    VStack {
                        // HStack for logo, title, and toggle button
                        HStack {
                            Image("discord")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30)
                            Spacer()
                                .frame(width: 15)
                            Text("Discord")
                            Spacer()
                            
                            Button(action: {
                                if ((didTapPhone == false) && (didTapEmail == false) && (didTapGroupMe == false)) {
                                    didTapDiscord.toggle()
                                }
                            }) {
                                if (didTapDiscord == true) {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.yellow)
                                } else {
                                    Image(systemName: "star")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.black)
                                }
                            }
                            
                        }
                        
                        TextField("Phone Number", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .overlay(
                                Divider()
                                    .frame(height: 1.5)
                                    .overlay(.gray)
                                    .opacity(0.6)
                                    .offset(x: 0, y: 15)
                            )
                        
                    }
                    .padding(.all, 20)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(didTapDiscord == true ? .yellow : .black, lineWidth: didTapDiscord == true ? 3 : 2))
                    .padding(.horizontal, 30)
                    
                    // VStack for GroupMe Card
                    VStack {
                        // HStack for logo, title, and toggle button
                        HStack {
                            Image("groupme")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30)
                            Spacer()
                                .frame(width: 15)
                            Text("GroupMe")
                            Spacer()
                            Button(action: {
                                if ((didTapPhone == false) && (didTapDiscord == false) && (didTapEmail == false)) {
                                    didTapGroupMe.toggle()
                                }
                            }) {
                                if (didTapGroupMe == true) {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.yellow)
                                } else {
                                    Image(systemName: "star")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.black)
                                }
                            }
                            
                        }
                        
                        TextField("GroupMe Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .overlay(
                                Divider()
                                    .frame(height: 1.5)
                                    .overlay(.gray)
                                    .opacity(0.6)
                                    .offset(x: 0, y: 15)
                            )

                        
                    }
                    .padding(.all, 20)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(didTapGroupMe == true ? .yellow : .black, lineWidth: didTapGroupMe == true ? 3 : 2))
                    .padding(.horizontal, 30)
                    
                }
           
            }
            
            // Finish button
            Button(action: {}){
                Text("Finish")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 133)
            .padding(.vertical, 10)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.init(red: 71 / 255, green: 103 / 255, blue: 204 / 255), Color.init(red: 90 / 255, green: 186 / 255, blue: 255 / 255)]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(10)
            .padding(.top, 40)
        }
    }
        
}

struct ContactCards_Previews: PreviewProvider {
    static var previews: some View {
        ContactCards()
    }
}
