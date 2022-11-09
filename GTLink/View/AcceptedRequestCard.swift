//
//  AcceptedRequestCard.swift
//  GTLink
//
//  Created by Johnny Sanchez on 11/9/22.
//

import SwiftUI

struct AcceptedRequestCard: View {
    
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
                
                //Placeholder for the profile picture
                post_picture ?? Image(systemName: "book.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140) as! Image
                
                //Vertical stack created for the other contents
                VStack(alignment: .leading, spacing: 14) {
                    
                    //Status - contains name of the user and the status of the request
                    Text(status)
                        .font(.system(size: 16))
                    
                    //Project name - contains name of the user's project
                    HStack {
                        Text(pname)
                        .bold()
                    }.font(.system(size: 16))
                        .padding(.trailing, 10)
                    
                    //Contact - represents the action to contact the user
                    Button {
                    } label: {
                        Text("Contact").foregroundColor(.white)
                    }.background(Color.yellow)
                    
                }.padding(5)
            }
        }.frame(width: phone_size.width * 35/39, height: phone_size.height * 140/844)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
        //Set the measurements of the card
    }
}

struct AcceptedRequestCard_Previews: PreviewProvider {
    static var previews: some View {
        AcceptedRequestCard(post_picture: Image("penguin"), status: "George Burdell accepted your request to work on", pname: "WebDev: GT Dashboard ")
    }
}
