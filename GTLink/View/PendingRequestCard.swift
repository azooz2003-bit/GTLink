//
//  PendingRequestCard.swift
//  GTLink
//
//  Created by Johnny Sanchez on 11/9/22.
//

import SwiftUI


//Following structs are a work in progress: for now,
//both generate solid button functions: in the future,
//it will generate a gradient button similar to the one
//in the Figma File


struct CreateDeclineStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color.gray]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
        .padding(.horizontal, 10)
    }
}

struct CreateAcceptStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
        .padding(.horizontal, 10)
    }
}



//Pending Request Card
struct PendingRequestCard: View {
    
    //Constant represented to accomodate for different phone sizes
    let phone_size = UIScreen.main.bounds.size
    
    //Attributes the pending request card will have:
    //the profile picture, the student information, & the project name;
    //UUID used for iteration purposes
    
    let pfp: Image?
    let student_name: String
    let major: String
    let year: String
    let pname: String
    let pruuid = UUID()
    
    init(pfp: Image, student_name: String, major: String, year: String, pname: String) {
        self.pfp = pfp
        self.student_name = student_name
        self.major = major
        self.year = year
        self.pname = pname
    }
    
    var body: some View {
        //View of the accepted request card
        VStack(alignment: .leading, spacing: 0) {
            //Horizontal stack created for the time passed and
            //profile picture
            HStack(alignment: .top) {
                Group {
                    Image(systemName: "clock").padding(.leading, 17)
                    Text("X hours ago")
                        .font(.system(size: 12))
                }.padding(.top, 16)
            }
            
            //Vertical stack created for the profile picture
            VStack(alignment: .center) {
                pfp!
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .shadow(radius: 10)
            }.padding(.leading, 149).padding(.trailing, 151)
            
            //Vertical stack created for the other contents
            VStack(alignment: .center) {
                
                //Vertical stack created for the information about the student along with the request made & name of the project
                VStack(alignment: .center) {
                    Text(student_name).font(.system(size: 16)).bold()
                    Text(major).font(.system(size: 12))
                    Text("\(year) Year").font(.system(size: 12))
                    Text("Wants to work with you on")
                        .font(.system(size: 16)).bold().frame(alignment: .center)
                    Text(pname).font(.system(size: 36)).bold()
                }
                
                //Contains the buttons to accept or decline
                HStack {
                    Button {
                    } label: {
                        Text("Decline").foregroundColor(.white)
                    }.buttonStyle(CreateDeclineStyle())
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        Text("Accept").foregroundColor(.white)
                    }                        .buttonStyle(CreateAcceptStyle())
                }.padding(.trailing, 29).padding(.leading, 33).padding(.bottom, 18)
                
            }.padding(5)
        }.frame(width: phone_size.width * 35/39, height: phone_size.height * 289/844)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
        //Set the measurements of the card
    }
}

struct PendingRequestCard_Previews: PreviewProvider {
    static var previews: some View {
        PendingRequestCard(pfp: Image("penguin"), student_name: "George Burdell", major: "Computer Scientist", year: "Nth", pname: "AppDev: GTLink")
    }
}
