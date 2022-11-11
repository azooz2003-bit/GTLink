//
//  FeedScreen.swift
//  GTLink
//
//  Created by Amit Kulkarni on 10/13/22.
//

import SwiftUI

struct FeedScreen: View {
    var body: some View {
            //Contains the feed
            VStack {
                
                    //Adds the pending requests to designate the section for pending requests
                    Text("Pending Requests")
                        .font(.system(size: 25))
                        .bold()
                        .underline()
                    Spacer()
                    
                
                    //Placeholder to show a pending request
                    PendingRequestCard(pfp: Image("penguin"), student_name: "George Burdell", major: "Computer Scientist", year: "Nth", pname: "AppDev: GTLink")
                    
                    Spacer()
                    
                    //Adds text representing the section containing the accepted requests
                    Text("Accepted Requests")
                        .font(.system(size: 25))
                        .bold()
                        .underline()
            
                    Spacer()
                
                    //Placeholders showing the accepted requests
                    AcceptedRequestCard(pfp: Image("penguin"), student: "George Burdell", pname: "WebDev: GT Dashboard")
                    
                    Spacer()
                
                    AcceptedRequestCard(pfp: Image("penguin"), student: "George Burdell", pname: "CS 1999: Exam 1 Study")
                
                    Spacer()
                
            }
        }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedScreen()
    }
}
