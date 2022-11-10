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
            
            // Title
            Text("Select a primary way to connect with others.")
                .font(.system(size: 26))
                .bold()
                .fixedSize(horizontal: false, vertical: true)
                .position(x: 130, y: 20)
                .frame(width: 300)
            
            // Contact Cards
            
            Group {
                
                // Email
                VStack {
                    HStack {
                        Image(systemName: "envelope")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                        Spacer()
                            .frame(width: 15)
                        Text("Email")
                        Spacer()
                        Button(action: {
                            if ((didTapPhone == false) && (didTapDiscord == false) && (didTapGroupMe == false)) {
                                didTapEmail.toggle()
                            }
                        }) {
                            if (didTapEmail == true) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.yellow)
                            } else {
                                Image(systemName: "circle")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)
                            }
                        }
                        .frame(width: 30)
                    }
                    TextField("Email Address", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .overlay(Divider().offset(x: 0, y: 15))
                        .padding(.top, -10)
                        .frame(height: didTapEmail == true ? 30 : 0)
                        .clipped()
                }
                .padding(.all, 15)
                .padding(.bottom, -10)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(didTapEmail == true ? .yellow : .black, lineWidth: didTapEmail == true ? 3 : 2))
                .padding(.horizontal, 35)
                
                Spacer()
                    .frame(height: 25)
                
                
                // Phone
                VStack {
                    HStack {
                        Image(systemName: "phone")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28)
                        Spacer()
                            .frame(width: 20)
                        Text("Phone")
                        Spacer()
                        Button(action: {
                            if ((didTapEmail == false) && (didTapDiscord == false) && (didTapGroupMe == false)) {
                                didTapPhone.toggle()
                            }
                        }) {
                            if (didTapPhone == true) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.yellow)
                            } else {
                                Image(systemName: "circle")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)
                            }
                        }
                        .frame(width: 30)
                        
                    }
                    
                    TextField("Phone Number", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .overlay(Divider().offset(x: 0, y: 15))
                        .padding(.top, -10)
                        .frame(height: didTapPhone == true ? 30 : 0)
                        .clipped()
                }
                .padding(.all, 15)
                .padding(.bottom, -10)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(didTapPhone == true ? .yellow : .black, lineWidth: didTapPhone == true ? 3 : 2)
                )
                .padding(.horizontal, 35)
                
                Spacer()
                    .frame(height: 25)
                
                // Discord
                VStack {
                    HStack {
                        Image("discord")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .padding(.leading, -5)
                            .padding(.bottom, -5)
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
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.yellow)
                            } else {
                                Image(systemName: "circle")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)
                            }
                        }
                        .frame(width: 30)
                        
                    }
                    
                    TextField("Discord Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .overlay(Divider().offset(x: 0, y: 15))
                        .padding(.top, -10)
                        .frame(height: didTapDiscord == true ? 30 : 0)
                        .clipped()
                }
                .padding(.all, 15)
                .padding(.bottom, -10)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(didTapDiscord == true ? .yellow : .black, lineWidth: didTapDiscord == true ? 3 : 2))
                .padding(.horizontal, 35)
                
                Spacer()
                    .frame(height: 25)
                
                // GroupMe
                VStack {
                    HStack {
                        Image("groupme")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                        Spacer()
                            .frame(width: 15)
                        Text("GroupMe")
                        Spacer()
                        Button(action: {
                            if ((didTapEmail == false) && (didTapDiscord == false) && (didTapPhone == false)) {
                                didTapGroupMe.toggle()
                            }
                        }) {
                            if (didTapGroupMe == true) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.yellow)
                            } else {
                                Image(systemName: "circle")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)
                            }
                        }
                        
                    }
                    
                    TextField("GroupMe Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .overlay(Divider().offset(x: 0, y: 15))
                        .padding(.top, -10)
                        .frame(height: didTapGroupMe == true ? 30 : 0)
                        .clipped()
                }
                .padding(.all, 15)
                .padding(.bottom, -10)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(didTapGroupMe == true ? .yellow : .black, lineWidth: didTapGroupMe == true ? 3 : 2))
                .padding(.horizontal, 35)
                
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
            .padding(.top, 100)
        }
    }
        
}

struct ContactCards_Previews: PreviewProvider {
    static var previews: some View {
        ContactCards()
    }
}
