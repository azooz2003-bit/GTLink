//
//  AcceptedRequestCard.swift
//  GTLink
//
//  Created by Johnny Sanchez on 11/9/22.
//
import SwiftUI

struct AcceptedRequestCard: View {

    //Constant used for accomodation of any phone size
    
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
            HStack {

                //Sets the profile picture
                pfp!
                    .resizable()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .shadow(radius: 2, y: 2)
                    .padding(.horizontal, 10)

                //Vertical stack created for the other elements
                VStack() {
                    VStack(alignment: .leading) {
                        //Status - contains name of the user and the status of the request
                        Text("\(student) accepted your request to work on")
                            .font(.system(size: 18)).fixedSize(horizontal: false, vertical: true).padding(.bottom, 0.01)

                        //Project name - contains name of the user's project
                        Text(pname)
                            .bold().font(.system(size: 18))
                    }


                }

                //Contact - represents the action to contact the user
                Button {
                } label: {
                    Label("", systemImage: "person.crop.circle.badge.plus").foregroundColor(.white).padding(.leading, 10).frame(maxWidth: 35, maxHeight: 35, alignment: .center).background(content: {
                        LinearGradient(gradient: Gradient(colors: [Color("LightYel"), Color("DarkYel")]), startPoint: .leading, endPoint: .trailing)
                    }).font(.system(size: 20)).cornerRadius(8)

                }.padding(.top, 70).padding(.bottom, 5)

            }
        }.frame(maxWidth: .infinity, minHeight: 120)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 4, y: 3)
            .padding()
        //Set the measurements of the card relative to the phone size
    }
}


//Generates a preview of one accepted request card
struct AcceptedRequestCard_Previews: PreviewProvider {
    static var previews: some View {
        AcceptedRequestCard(pfp: Image("penguin"), student: "George Burdell", pname: "WebDev: GT Dashboard ")
    }
}
