//
//  Card.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 10/25/22.
//

import SwiftUI

struct Card: View {
    
    let phone_size = UIScreen.main.bounds.size
    
    let post_picture: Image?
    let title: String
    let username: String
    let post_date: Date
    let tags: [Tag]
    let description: String
    
    init(post_picture: Image, title: String, username: String, post_date: Date, tags: [Tag], description: String) {
        self.post_picture = post_picture
        self.title = title
        self.username = username
        self.post_date = post_date
        self.tags = tags
        self.description = description
    }
    
    var body: some View {
        //card view
        VStack {
            
            HStack(alignment: .top) {
                
                //post image
                post_picture ?? Image(systemName: "book.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140) as! Image
                
                //right side VStack
                VStack(alignment: .leading, spacing: 14) {
                    
                    
                    Text(title)
                        .font(.system(size: 16))
                        .bold()
                    
                    //username and date
                    HStack {
                        Image(systemName: "person")
                        Text(username)
                        Spacer()
                        Image(systemName: "clock")
                        Text(date_to_string(date:post_date))
                    }.font(.system(size: 12))
                        .padding(.trailing, 10)
                    
                    //tags list
                    HStack {
                        if(tags.count > 0) {
                            Text(tags[0].rawValue).padding(5).background(tags[0].color).clipShape(Capsule())
                        }
                        if(tags.count > 1) {
                            Text(tags[1].rawValue).padding(5).background(tags[1].color).clipShape(Capsule())
                        }
                        if(tags.count > 2) {
                            Text("+\(tags.count - 2)").padding(5).background(Color.gray).clipShape(Capsule())
                        }
                    }.font(.system(size: 10.7))
                        .foregroundColor(Color.white)
                        .padding(.trailing, 5)
                    
                    //description of post
                    Text(description)
                        .font(.system(size: 10))
                        .truncationMode(.tail)
                    
                }.padding(5)
            }
        }.frame(width: phone_size.width * 35/39, height: phone_size.height * 140/844)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
    }
    
    func date_to_string(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YY"
        return dateFormatter.string(from: date)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(post_picture: Image("penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell", post_date: Date(), tags: [Tag.class_project, Tag.c_cplusplus, Tag.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.")
    }
}
