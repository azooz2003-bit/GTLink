//
//  FeedScreen.swift
//  GTLink
//
//  Created by Amit Kulkarni on 10/13/22.
//

import SwiftUI
import Firebase

struct PostV1: Hashable, Identifiable {
    var id: UUID = UUID()
    var post_picture: UIImage?
    var title: String
    var username: String
    var post_date: Date
    var tags: [Tags]
    var description: String
}

struct FeedScreen: View {
    @EnvironmentObject var feedVM: FeedViewModel
    
    @State var createPostNav = false
    @State var postClicked = false
    
    @State var selectedPost: Post?
    
    let phone_size = UIScreen.main.bounds.size
    
    var postsFound: [PostV1] = [] // CHANGE TO POST
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("\(postsFound.count) project\(postsFound.count > 1 ? "s" : "") found based on your tags")
                        .font(.system(size: 17))
                    Spacer()
                    Button {
                        feedVM.showFilterSheet.toggle()
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.system(size: 32))
                            .foregroundColor(.black)
                    }.padding(.trailing, 14)

                }
                .padding([.leading, .top], 39)
                ScrollView {
                    let postings = feedVM.allPostings ?? []
                    ForEach(postings, id: \.self) { post in
                        Button(action: {
                            // opens detailed view of post
                            selectPost(post: post) { success in
                                postClicked = success
                            }
                            
                        }, label: {
                            generate_card(post: post)
                                .foregroundColor(.black)
                                .padding()
                        })
                    }
                }.frame(width: phone_size.width)
                
            }.frame(width: phone_size.width)
                .sheet(isPresented: Binding(get: {feedVM.showFilterSheet}, set: { feedVM.showFilterSheet = $0 })) {
                    VStack {
                        FeedFilterView(viewModel: self.feedVM, tags: feedVM.selectedTags, projectType: feedVM.selectedType)
                    }.padding(.leading)
                        .presentationDetents([.medium])
                }
            
            //create button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        //open create post screen
                        createPostNav = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 40))
                            .foregroundColor(Color(red: 215/255, green: 215/255, blue: 215/255))
                            .padding(20)
                            .frame(width: 75, height: 75)
                            .background(LinearGradient(colors: [Color(red: 62/255, green: 127/255, blue: 204/255), Color(red: 38/255, green: 87/255, blue: 145/255)], startPoint: .leading, endPoint: .trailing))
                            .clipShape(Circle())
                            
                            .padding(10).shadow(radius: 10)
                    }.padding(.bottom, 70)
                    
                }
            }
            
        }.navigationDestination(isPresented: $createPostNav, destination: {
            NewPostScreen().environmentObject(feedVM)
        }).navigationDestination(isPresented: $postClicked, destination: {
            PostViewScreen(post: selectedPost ?? Post(postingID: "", title: "", image: UIImage(), owner: "", date: Date(), description: "", tags: [.beginner : true], isProject: false, isStudy: true, members: ["none"], receivedRequests: [""  :["" : true]])).environmentObject(feedVM)
        })
    }
    
    func generate_card(post: Post) -> Card {
        let card = Card(post_picture: Image(uiImage: ((post.image ?? UIImage(systemName: "person.fill"))!)), title: post.title, username: post.owner, post_date: post.date, tags: [Tags](post.tags.filter({$0.value == true}).keys), description: post.description)
        return card
    }
    
    func selectPost(post: Post, completion: @escaping (Bool) -> Void) {
        self.selectedPost = post
        completion(true)
    }
    
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedScreen(postsFound: [
            PostV1(post_picture: UIImage(named: "penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell2", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus, Tags.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma."),
            PostV1(post_picture: UIImage(named: "penguin"), title: "CS 1999: Exam 2 Study", username: "gburdell", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus, Tags.cs1999, Tags.homework], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma."),
            PostV1(post_picture: UIImage(named: "penguin"), title: "CS 1999: Exam 3 Study", username: "georgeBurd", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma."),
            PostV1(post_picture: UIImage(named: "penguin"), title: "CS 1999: Exam 3 Study", username: "georgeBurd", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma."),
            PostV1(post_picture: UIImage(named: "penguin"), title: "CS 1999: Exam 3 Study", username: "georgeBurd", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.")
        ]
        ).environmentObject(FeedViewModel(userVM: UserViewModel()))
    }
}
