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
        ZStack {
            VStack {
                HStack {
                    Text("\(postsFound.count) project\(postsFound.count > 1 ? "s" : "") found based on your tags")
                        .font(.system(size: 17))
                    Spacer()
                    Button {
                        // show filter sheet view
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.system(size: 32))
                            .foregroundColor(.black)
                    }.padding(.trailing, 14)

                }
                .padding([.leading], 39)
                ScrollView {
                    ForEach(postsFound, id: \.self) { post in
                        generate_card(post: post)
                            .padding()
                    }
                }.frame(width: phone_size.width)
                
            }.frame(width: phone_size.width)
            
            //create button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        //open create post screen
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 40))
                            .foregroundColor(Color(red: 215/255, green: 215/255, blue: 215/255))
                            .padding(20)
                            .frame(width: 75, height: 75)
                            .background(LinearGradient(colors: [Color(red: 62/255, green: 127/255, blue: 204/255), Color(red: 38/255, green: 87/255, blue: 145/255)], startPoint: .leading, endPoint: .trailing))
                            .clipShape(Circle())
                            
                            .padding(10)
                    }
                    
                }
            }
            
        }
    }
    
    func generate_card(post: Post) -> Card {
        let card = Card(post_picture: Image(uiImage: (post.post_picture ?? UIImage(systemName: "person.fill"))!), title: post.title, username: post.username, post_date: post.post_date, tags: post.tags, description: post.description)
        return card
    }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedScreen(postsFound: [
            Post(post_picture: UIImage(named: "penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell2", post_date: Date(), tags: [Tag.class_project, Tag.c_cplusplus, Tag.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma."),
            Post(post_picture: UIImage(named: "penguin"), title: "CS 1999: Exam 2 Study", username: "gburdell", post_date: Date(), tags: [Tag.class_project, Tag.c_cplusplus, Tag.cs1999, Tag.homework], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma."),
            Post(post_picture: UIImage(named: "penguin"), title: "CS 1999: Exam 3 Study", username: "georgeBurd", post_date: Date(), tags: [Tag.class_project, Tag.c_cplusplus], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma."),
            Post(post_picture: UIImage(named: "penguin"), title: "CS 1999: Exam 3 Study", username: "georgeBurd", post_date: Date(), tags: [Tag.class_project, Tag.c_cplusplus], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma."),
            Post(post_picture: UIImage(named: "penguin"), title: "CS 1999: Exam 3 Study", username: "georgeBurd", post_date: Date(), tags: [Tag.class_project, Tag.c_cplusplus], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.")
            
        ]
        )
    }
}
