//
//  FeedScreen.swift
//  GTLink
//
//  Created by Amit Kulkarni on 10/13/22.
//

import SwiftUI

struct RequestsScreen: View {
    @EnvironmentObject var feedVM: FeedViewModel
    
    var pendingRequests: [PendingRequestCard] = []
    var acceptedRequests: [AcceptedRequestCard] = []
    
    var body: some View {
        //Gets phone size to create appropriate sizes for elements
        
        
        //Vertical stack which represents the request screen
        VStack(spacing: 5) {
            
            //Pending request title with divider to designate section
            
            Text("Pending Requests")
                .font(.system(size: 20))
                .bold()
                
            Divider().frame(width: 200, height: 4).overlay(.black)
            
            //ScrollView representing the available pending requests
            VStack {
                ScrollView {
                    let pending = feedVM.pendingRequests
                    ForEach(Array<Post>(pending.keys) , id:\.id) { post in
                        // HARDCODE this
                        let reqs: [Request] = pending[post]!
                        ForEach(reqs, id:\.id) { pr in
                            let user = pr.sender
                            PendingRequestCard(user: user, pfp: Image(uiImage: UIImage(data: user.pfpDecoded) ?? UIImage()), student_name: user.name, major: user.major, year: user.year, pname: pr.targetProject.title)
                        }
                        
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: 370).padding(.bottom, 15)
           
                    
            //Accepted requests title with divider to designate section
            Text("Accepted Requests")
                .font(.system(size: 20))
                .bold()
            
            Divider().frame(width: 200, height: 4).frame(height: 4).overlay(.black).padding(.bottom, 12)
            
            //ScrollView representing the available accepted requests
            VStack {
                ScrollView {
                    let accepted = feedVM.acceptedRequests
                    ForEach(Array<Post>(accepted.keys) , id:\.id) { post in
                        let reqs: [Request] = accepted[post]!
                        ForEach(reqs, id:\.id) { ar in
                            let user = ar.sender
                            AcceptedRequestCard(pfp: Image(uiImage: UIImage(data: user.pfpDecoded) ?? UIImage()), student: user.name, pname: ar.targetProject.title)
                        }
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: 220).padding(.bottom, 80)
            
        }
        
        
        
        }
}

struct RequestsScreen_Previews: PreviewProvider {
    static var previews: some View {
        //RequestsScreen(pendingRequests: [PendingRequestCard(user: , pfp: Image("os1"), student_name: "George Burdell", major: "Computer Scientist", year: "Nth", pname: "AppDev: GTLink"), PendingRequestCard(user: <#User#>, pfp: Image("os1"), student_name: "George Burdell", major: "Computer Scientist", year: "Nth", pname: "AppDev: GTLink")], acceptedRequests:[AcceptedRequestCard(pfp: Image("os1"), student: "George Burdell", pname: "WebDev: GT Dashboard"),
    AcceptedRequestCard(pfp: Image("os1"), student: "George Burdell", pname: "CS 1999: Exam 1 Study")
    }
}
