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
        
        
        //Vertical stack which represents the request screen
        VStack(spacing: 5) {
            
            //Pending request title with divider to designate section
            Text("Pending Requests")
                .font(.system(size: 20))
                .bold().padding(.top, 60)
                
            Divider().frame(width: 200, height: 4).overlay(.black).padding(.bottom, 34)
            
            //ScrollView representing the available pending requests
            VStack {
                ScrollView {
                    ForEach(prs, id:\.pruuid) { pr in
                        PendingRequestCard(pfp: pr.pfp!, student_name: pr.student_name, major: pr.major, year: pr.year, pname: pr.pname)
                    }
                }
            }.frame(maxWidth: .infinity, minHeight: 370)
           
                    
            //Accepted requests title with divider to designate section
            Text("Accepted Requests")
                .font(.system(size: 20))
                .bold().padding(.top, 38)
            
            Divider().frame(width: 200, height: 4).frame(height: 4).overlay(.black).padding(.bottom, 12)
            
            //ScrollView representing the available accepted requests
            VStack {
                ScrollView {
                    ForEach(ars, id:\.aruuid) { ar in
                        AcceptedRequestCard(pfp: ar.pfp!, student: ar.student, pname: ar.pname)
                    }
                }
            }.frame(maxWidth: .infinity, minHeight: 370)
            
        }
        
        
        
        }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        RequestsScreen(prs: [PendingRequestCard(pfp: Image("os1"), student_name: "George Burdell", major: "Computer Scientist", year: "Nth", pname: "AppDev: GTLink"), PendingRequestCard(pfp: Image("os1"), student_name: "George Burdell", major: "Computer Scientist", year: "Nth", pname: "AppDev: GTLink")], ars:[AcceptedRequestCard(pfp: Image("os1"), student: "George Burdell", pname: "WebDev: GT Dashboard"),
           AcceptedRequestCard(pfp: Image("os1"), student: "George Burdell", pname: "CS 1999: Exam 1 Study")])
    }
}
