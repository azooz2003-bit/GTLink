//
//  ProfilePage.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 11/23/22.
//

import SwiftUI

struct ProfilePage: View {
    @State var tags = [
        addTag(text: "iOS", fontSize: 16),
        addTag(text: "Developer", fontSize: 16),
        addTag(text: "Beginner", fontSize: 16),
        addTag(text: "Swift", fontSize: 16),
        addTag(text: "iOS Club", fontSize: 16),
        addTag(text: "UI/UX", fontSize: 16)
    ]
    @State var activeClicked = true
    @State var whiteBlockOffset: CGFloat = 0
    
    var body: some View {
        
        ZStack {
    
            LinearGradient(colors: [.blue, .purple, .cyan, .blue], startPoint: .leading, endPoint: .trailing).ignoresSafeArea()
            
                
            VStack {
                
                VStack {
                    Text("George Burdell").foregroundColor(.white).font(.system(size: 30, weight: .bold))
                    Text("@gburdell").foregroundColor(.white).font(.system(size: 25)).padding(.vertical, 0.1)
                    Text("Computer Science").foregroundColor(.white).font(.system(size: 25)).padding(.vertical, 0.1)
                    Text("3rd year").foregroundColor(.white).font(.system(size: 25)).padding(.vertical, 0.1)
                    
                }.padding(.vertical, 30)
                
                
                
                VStack {
                    Image("penguin").resizable().scaledToFill().frame(width: 130, height: 130).clipShape(Ellipse()).shadow(radius: 5,y: 4).overlay(Ellipse().stroke(.white, lineWidth: 4)).offset(y:  whiteBlockOffset < 600 ? -whiteBlockOffset + 600 : 0)
                    
                    VStack {
                        ScrollView(.vertical, showsIndicators: true) {
                            Text("Bio:").font(.system(size: 18, weight: .bold)).frame(maxWidth: .infinity, alignment: .leading).padding(.top).padding(.leading)
                            
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget blandit id nibh eget dolor tincidunt quis vitae. Donec cursus volutpat turpis sed.").multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                            Text("Tags:").font(.system(size: 18, weight: .bold)).frame(maxWidth: .infinity, alignment: .leading).padding(.top, 10).padding(.leading)
                            
                            TagView(tags: $tags, fontSize: 15).frame(maxWidth: .infinity, alignment: .center)

                            HStack {
                                Button(action:{
                                    activeClicked = true
                                }) {
                                    VStack {
                                        Text("2 " +  "Active").font(.system(size: 23, weight: .bold)).foregroundColor(!activeClicked ? .gray : .black).padding(.bottom, -4)
                                        Rectangle().frame(width: 100, height: 4).cornerRadius(6).foregroundColor(!activeClicked ? .white : .black)
                                    }
                                }.padding(.horizontal)
                                
                                Button(action:{
                                    activeClicked = false
                                }) {
                                    VStack {
                                        Text("1 " +  "Completed").font(.system(size: 23, weight: .bold)).foregroundColor(activeClicked ? .gray : .black).padding(.bottom, -4)
                                        
                                        Rectangle().frame(width: 135, height: 4).cornerRadius(6).foregroundColor(activeClicked ? .white : .black)
                                        
                                    }
                                }.padding(.horizontal, 30)
                            }.padding(.vertical)
                                
                                
                                VStack {
                                    Card(post_picture: Image("penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus, Tags.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.").padding(.bottom)
                                    
                                    Card(post_picture: Image("penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus, Tags.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.").padding(.bottom)
                                    
                                    Card(post_picture: Image("penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus, Tags.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.").padding(.bottom)
                                    
                                    Card(post_picture: Image("penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus, Tags.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.").padding(.bottom)
                                }.padding(.bottom, 100)
                                
                            }
                            
                            
                        }.offset(y:  whiteBlockOffset < 600 ? -whiteBlockOffset + 600 : 0)
                }.padding(.horizontal, 15).background(content: {
                        Color.white.cornerRadius(30).offset(y: whiteBlockOffset < 600 ? -whiteBlockOffset + 600 : 0).overlay {
                            
                            GeometryReader { coords -> Color in
                                let minY = coords.frame(in: .global).minY
                                
                                DispatchQueue.main.async {
                                    self.whiteBlockOffset = minY
                                }
                                
                                return Color.clear
                            }.frame(width: 0, height: 0) // to replicate empty view
                            
                            
                        }.padding(.top, 60).ignoresSafeArea()
                    })
                    
                }
                
            
            }
            
        
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
