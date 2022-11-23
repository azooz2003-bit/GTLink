//
//  AcceptedRequestCard.swift
//  GTLink
//
//  Created by Johnny Sanchez on 11/9/22.
//

import SwiftUI

struct AcceptedRequestCard: View {
    
    //Constant used for accomodation of any phone size
    let phone_size = UIScreen.main.bounds.size
    
    
    //Attributes the accepted request card will have:
    //the profile picture, the student who accepted the request, and the project name; UUID used for iteration purposes
    let pfp: Image?
    let student: String
    let pname: String
    let aruuid = UUID()
    
    init(pfp: Image, student: String, pname: String) {
        self.pfp = pfp
        self.student = student
        self.pname = pname
    }
    
    var body: some View {
        //Vertical stack that represents the accepted request card
        VStack() {
            
            //Horizontal stack that holds the card information
            HStack(alignment: .top) {
                
                //Sets the profile picture
                pfp!
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.trailing, 18)
                
                //Vertical stack created for the other elements
                VStack() {
                    VStack(alignment: .leading) {
                        //Status - contains name of the user and the status of the request
                        Text("\(student) accepted your request to work on")
                            .font(.system(size: 16)).fixedSize(horizontal: false, vertical: true)
                        
                        //Project name - contains name of the user's project
                        Text(pname)
                            .bold().font(.system(size: 16))
                    }
                    
                    //Contact - represents the action to contact the user
                    Button {
                    } label: {
                        Text("Contact").foregroundColor(.white)
                    }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 10))
                        .foregroundColor(.white)
                        .tint(.yellow)
                }
            }.padding(.leading, 18).padding(.trailing, 37).padding(.top, 18).padding(.bottom, 18)
        }.frame(width: phone_size.width * 35/39, height: phone_size.height * 125/844)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
            .padding(.bottom, 10)
        //Set the measurements of the card relative to the phone size
    }
}


//Generates a preview of one accepted request card
struct AcceptedRequestCard_Previews: PreviewProvider {
    static var previews: some View {
        AcceptedRequestCard(pfp: Image("penguin"), student: "George Burdell", pname: "WebDev: GT Dashboard ")
    }
}
