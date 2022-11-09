//
//  PendingRequestCard.swift
//  GTLink
//
//  Created by Johnny Sanchez on 11/9/22.
//

import SwiftUI

struct PendingRequestCard: View {
    
    let phone_size = UIScreen.main.bounds.size
    
    
    //Attributes the accepted request card will have:
    //a picture, the status of the request, and the project name
    let post_picture: Image?
    let status: String
    let pname: String
    
    init(post_picture: Image, status: String, pname: String) {
        self.post_picture = post_picture
        self.status = status
        self.pname = pname
    }
    
    var body: some View {
        //View of the accepted request card
        VStack {
            
            //Horizontal stack that holds the card information
            HStack(alignment: .top) {
                
                //Vertical stack created for the other contents
                VStack(alignment: .leading, spacing: 14) {
                    
                    HStack(alignment: .top) {
                        Image(systemName: "clock")
                        Text("X hours ago")
                        
                        //Placeholder for the profile picture
                        post_picture ?? Image(systemName: "book.fill")
                        .resizable()
                        .frame(width: 10, height: 10, alignment: .center)
                        .padding(20)
                        .clipShape(Circle())
                        .shadow(radius: 20) as! Image
                    }
                    
                    VStack {
                        Text("George Burdell").font(.system(size: 20)).bold()
                        Text("Computer Scientist").font(.system(size: 16))
                        Text("Nth Year").font(.system(size: 14))
                    }
                    //Status - contains name of the user and the status of the request
                    Text(status)
                        .font(.system(size: 16)).bold().frame(alignment: .center)
                    
                    //Project name - contains name of the user's project
                    Text(pname).font(.system(size: 30)).bold()
                    
                    //Contact - represents the action to contact the user
                    HStack {
                        Button {
                        } label: {
                            Text("Decline").foregroundColor(.white)
                        }.background(Color.gray)
                        
                        Spacer()
                        
                        Button {
                        } label: {
                            Text("Accept").foregroundColor(.white)
                        }.background(Color.yellow)
                    }.padding(.trailing, 10)
                    
                }.padding(5)
            }
        }.frame(width: phone_size.width * 35/39, height: phone_size.height * 375/844)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
        //Set the measurements of the card
    }
}

struct PendingRequestCard_Previews: PreviewProvider {
    static var previews: some View {
        PendingRequestCard(post_picture: Image("penguin"), status: "Wants to work with you on", pname: "WebDev: GT Dashboard ")
    }
}
