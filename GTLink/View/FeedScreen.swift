//
//  FeedScreen.swift
//  GTLink
//
//  Created by Amit Kulkarni on 10/13/22.
//

import SwiftUI
import Firebase
 
struct Post: Hashable, Identifiable {
    var id: UUID = UUID()
    var post_picture: UIImage?
    var title: String
    var username: String
    var post_date: Date
    var tags: [Tag]
    var description: String
}

struct FeedScreen: View {
    
    let phone_size = UIScreen.main.bounds.size

    var postsFound: [Post]
    var body: some View {
        VStack {
            HStack {
                Text("Projects found info and filter button to come.")
            }
            ScrollView {
                ForEach(postsFound, id: \.self) { post in
                    generate_card(post: post)
                        .padding()
                }
            }.frame(width: phone_size.width)
            
        }.frame(width: phone_size.width)
    }
    
    func generate_card(post: Post) -> Card {
        let card = Card(post_picture: Image(uiImage: post.post_picture!), title: post.title, username: post.username, post_date: post.post_date, tags: post.tags, description: post.description)
        return card
    }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedScreen(postsFound: [
        Post(post_picture: UIImage(penguin", title: "CS 1999: Exam 1 Study", username: "gburdell2", post_date: Date(), tags: [Tag.class_project, Tag.c_cplusplus, Tag.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma."),
        Post(post_picture: "penguin", title: "CS 1999: Exam 2 Study", username: "gburdell", post_date: Date(), tags: [Tag.class_project, Tag.c_cplusplus, Tag.cs1999, Tag.homework], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma."),
        Post(post_picture: "penguin", title: "CS 1999: Exam 3 Study", username: "georgeBurd", post_date: Date(), tags: [Tag.class_project, Tag.c_cplusplus], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.")
        
        ]
        )
    }
}
