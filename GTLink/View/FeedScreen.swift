//
//  FeedScreen.swift
//  GTLink
//
//  Created by Amit Kulkarni on 10/13/22.
//

import SwiftUI

struct FeedScreen: View {
    var body: some View {
        ScrollView {
            VStack {
                    Text("Pending Requests")
                        .font(.system(size: 25))
                        .bold()
                        .underline()
                    Spacer()
                    
                    PendingRequestCard(post_picture: Image("penguin"), status: "Wants to work with you on", pname: "AppDev: GTLink")
                    
                    Spacer()
                    
                    Text("Accepted Requests")
                        .font(.system(size: 25))
                        .bold()
                        .underline()
            
                    Spacer()
                
                    AcceptedRequestCard(post_picture: Image("penguin"), status: "George Burdell accepted your request to work on", pname: "WebDev: GT Dashboard")
                    
                    Spacer()
                
                    AcceptedRequestCard(post_picture: Image("penguin"), status: "You accepted George Burdell's request to work on", pname: "CS 1999: Exam 1 Study")
                
                    Spacer()
                
            }
        }
    }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedScreen()
    }
}
