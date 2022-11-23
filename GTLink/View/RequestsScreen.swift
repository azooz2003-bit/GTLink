//
//  FeedScreen.swift
//  GTLink
//
//  Created by Amit Kulkarni on 10/13/22.
//

import SwiftUI

struct RequestsScreen: View {
    
    var prs: [PendingRequestCard]
    var ars: [AcceptedRequestCard]
    
    var body: some View {
        //Gets phone size to create appropriate sizes for elements
        let phone_size = UIScreen.main.bounds.size
        
        
        //Vertical stack which represents the request screen
        VStack(spacing: 0) {
            
            //Pending request title with divider to designate section
            Text("Pending Requests")
                .font(.system(size: 20))
                .bold()
                
            Divider().frame(width: 188/390 * phone_size.width).frame(height: 4).overlay(.black).padding(.bottom, 34)
            
            //ScrollView representing the available pending requests
            ScrollView {
                ForEach(prs, id:\.pruuid) { pr in
                    PendingRequestCard(pfp: pr.pfp!, student_name: pr.student_name, major: pr.major, year: pr.year, pname: pr.pname)
                }
            }
                    
            //Accepted requests title with divider to designate section
            Text("Accepted Requests")
                .font(.system(size: 20))
                .bold().padding(.top, 38)
            
            Divider().frame(width: 188/390 * phone_size.width).frame(height: 4).overlay(.black).padding(.bottom, 12)
            
            //ScrollView representing the available accepted requests
            ScrollView {
                ForEach(ars, id:\.aruuid) { ar in
                    AcceptedRequestCard(pfp: ar.pfp!, student: ar.student, pname: ar.pname)
                }
            }
        }.padding(.top).padding(.leading, 20).padding(.trailing, 20)
        
        
        
        }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        RequestsScreen(prs: [                    PendingRequestCard(pfp: Image("penguin"), student_name: "George Burdell", major: "Computer Scientist", year: "Nth", pname: "AppDev: GTLink")], ars:[AcceptedRequestCard(pfp: Image("penguin"), student: "George Burdell", pname: "WebDev: GT Dashboard"),
           AcceptedRequestCard(pfp: Image("penguin"), student: "George Burdell", pname: "CS 1999: Exam 1 Study")])
    }
}
