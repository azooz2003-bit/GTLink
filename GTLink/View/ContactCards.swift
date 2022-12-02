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
    
    @State var email: String = ""
    @State var phone: String = ""
    @State var discord: String = ""
    @State var groupMe: String = ""

    
    var body: some View {
        
        VStack {
            
            // Back button
            Button(action: {}){
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
            }
            .foregroundColor(Color.black).padding(.bottom).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 30)
         
            
            // Step 1/4
            Text("Step 4/4")
                .font(.system(size: 20)).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 30).padding(.bottom, 1).padding(.top, 50)
            
            // Title
            Text("Select a primary way to connect with others.")
                .font(.system(size: 24))
                .bold()
                .fixedSize(horizontal: false, vertical: true).padding(.trailing, 80)
                .frame(minWidth: 300, maxWidth: .infinity, alignment: .leading).padding(.leading, 30).padding(.bottom, 100)
            
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
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Spacer()
                                .frame(width: 21)
                            Text("Email")
                            Spacer()
                            Button(action: {
                                if ((didTapPhone == false) && (didTapDiscord == false) && (didTapGroupMe == false)) {
                                    withAnimation {
                                        didTapEmail.toggle()
                                    }
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
                        
                        if (didTapEmail) {
                            TextField("Email Address", text: $email)
                                .overlay(
                                    Divider()
                                        .frame(height: 1.5)
                                        .overlay(.gray)
                                        .opacity(0.6)
                                        .offset(x: 0, y: 15)
                            )
                            
                            
                        }
                        
                        
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
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Spacer()
                                .frame(width: 21)
                            Text("Phone")
                            Spacer()
                            Button(action: {
                                if ((didTapEmail == false) && (didTapDiscord == false) && (didTapGroupMe == false)) {
                                    withAnimation {
                                        didTapPhone.toggle()
                                    }
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
                        
                        if (didTapPhone) {
                            TextField("Phone Number", text: $phone)
                                .overlay(
                                    Divider()
                                        .frame(height: 1.5)
                                        .overlay(.gray)
                                        .opacity(0.6)
                                        .offset(x: 0, y: 15)
                                )
                        }
                        
                        
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
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Spacer()
                                .frame(width: 15)
                            Text("Discord")
                            Spacer()
                            
                            Button(action: {
                                if ((didTapPhone == false) && (didTapEmail == false) && (didTapGroupMe == false)) {
                                    withAnimation {
                                        didTapDiscord.toggle()
                                    }
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
                        
                        if (didTapDiscord) {
                            TextField("Discord Username", text: $discord)
                                .overlay(
                                    Divider()
                                        .frame(height: 1.5)
                                        .overlay(.gray)
                                        .opacity(0.6)
                                        .offset(x: 0, y: 15)
                                )
                        }
                        
                        
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
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Spacer()
                                .frame(width: 15)
                            Text("GroupMe")
                            Spacer()
                            Button(action: {
                                if ((didTapPhone == false) && (didTapDiscord == false) && (didTapEmail == false)) {
                                    withAnimation {
                                        didTapGroupMe.toggle()
                                    }
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
                        
                        if (didTapGroupMe) {
                            TextField("GroupMe Username", text: $groupMe)
                                .overlay(
                                    Divider()
                                        .frame(height: 1.5)
                                        .overlay(.gray)
                                        .opacity(0.6)
                                        .offset(x: 0, y: 15)
                                )
                        }
                        
                        
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
                    .foregroundColor(.white).padding(.horizontal, 133)
                    .padding(.vertical, 10)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.init(red: 71 / 255, green: 103 / 255, blue: 204 / 255), Color.init(red: 90 / 255, green: 186 / 255, blue: 255 / 255)]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
            }
            .padding(.top, 40)
        }
    }
        
}

struct ContactCards_Previews: PreviewProvider {
    static var previews: some View {
        ContactCards()
    }
}
