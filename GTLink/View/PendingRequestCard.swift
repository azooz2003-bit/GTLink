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
    //NOTE: deleted the phone size, swiftUI already scales things for different phones so dont worry. You just have to make sure to apply proper padding, etc.
    //Attributes the pending request card will have:
    //the profile picture, the student information, & the project name;
    //UUID used for iteration purposes
    
    let user: User
    let pfp: Image?
    let student_name: String
    let major: String
    let year: String
    let pname: String
    let pruuid = UUID()

    init(user: User, pfp: Image, student_name: String, major: String, year: String, pname: String) {
        self.user = user
        self.pfp = pfp
        self.student_name = student_name
        self.major = major
        self.year = year
        self.pname = pname
    }

    var body: some View {
        //View of the accepted request card
        VStack {
            //Horizontal stack created for the time passed and
            //profile picture
            HStack(alignment: .top) {

                Image(systemName: "clock").padding(.leading, 17)
                    Text("X hours ago")
                        .font(.system(size: 12)).padding(.top, 2)

            }.frame(maxWidth: .infinity, alignment: .leading)

            //Vertical stack created for the profile picture
            pfp!.resizable().frame(width: 70, height: 70, alignment: .center).clipShape(Circle()).shadow(radius: 4).padding(.horizontal, 140)


            //Vertical stack created for the other contents
            VStack {

                //Vertical stack created for the information about the student along with the request made & name of the project
                VStack(alignment: .center) {
                    Text(user.name).font(.system(size: 16)).bold()
                    Text(user.major).font(.system(size: 12))
                    Text("\(user.year) Year").font(.system(size: 12))
                    Text("Wants to work with you on")
                        .font(.system(size: 16)).bold().frame(alignment: .center)
                    Text(user.name).font(.system(size: 36)).bold()
                }

                //Contains the buttons to accept or decline
                HStack {
                    Button {
                    } label: {
                        Text("Decline").frame(width: 145, height: 45)
                            .foregroundColor(Color("TextGray"))
                            .background(LinearGradient(gradient: Gradient(colors: [Color("LightGray"), Color("DarkGray")]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .padding(.leading, 40).font(.system(size: 20, weight: .medium, design: .rounded)).shadow(radius: 2, y: 1)
                    }

                    Spacer(minLength: 25)

                    Button {
                    } label: {
                        Text("Accept").frame(width: 145, height: 45)
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color("LightYel"), Color("DarkYel")]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .padding(.trailing, 40).font(.system(size: 20, weight: .medium, design: .rounded)).shadow(radius: 2, y: 1)
                    }
                }

            }
        }.frame(minWidth: 340, maxWidth: .infinity, minHeight: 330).background(Color.white).cornerRadius(15).shadow(radius: 4, y: 3).padding()
        //Set the measurements of the card
    }
}

struct PendingRequestCard_Previews: PreviewProvider {
    static var previews: some View {
        PendingRequestCard(user: User(username: "", pfpDecoded: Data(), bio: "", contact: [:], interests: [:], link: "", major: "", minor: "", name: "", sentRequests: ["":[:]], userID: "", year: "", projects: []), pfp: Image("penguin"), student_name: "George Burdell", major: "Computer Scientist", year: "Nth", pname: "AppDev: GTLink")
    }
}
