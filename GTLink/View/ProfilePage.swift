//
//  ProfilePage.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 11/23/22.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var feedVM : FeedViewModel
    
    let tagsDummy = [
        addTag(text: "iOS", color: .red, fontSize: 16),
        addTag(text: "Developer", color: .red, fontSize: 16),
        addTag(text: "Beginner", color: .red, fontSize: 16),
        addTag(text: "Swift", color: .red, fontSize: 16),
        addTag(text: "iOS Club", color: .red, fontSize: 16),
        addTag(text: "UI/UX", color: .red, fontSize: 16)
    ]
    @State var activeClicked = true
    @State var settingsPressed = false
    @State var whiteBlockOffset: CGFloat = 0
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        //let user = feedVM.userVM.user
        let tags = user.interests.map {
            addTag(text: $0.key.rawValue, color: $0.key.color, fontSize: 16)
        }
        
        ZStack {
                        
            
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                      
                    Rectangle()
                        .fill(RadialGradient(gradient: Gradient(colors: [.orange,  .white]), center: UnitPoint(x: 0, y: 0) , startRadius: 5, endRadius: 280)).frame( height: 400)
                       
                
                     
                    Rectangle()
                        .fill(RadialGradient(gradient: Gradient(colors: [.purple,  .white]), center: UnitPoint(x: 0.0, y: 0.8), startRadius: 5, endRadius: 300)).frame( height: 400)
                    Rectangle()
                        .fill(RadialGradient(gradient: Gradient(colors: [.blue,  .white]), center: UnitPoint(x: 0.5, y: 0), startRadius: 20, endRadius: 300)).frame( height: 400)
                       
                    Rectangle()
                        .fill(RadialGradient(gradient: Gradient(colors: [.green,  .white]), center: UnitPoint(x: 0.8, y: 0.8), startRadius: 5, endRadius: 300)).frame( height: 400)
                    Rectangle()
                        .fill(RadialGradient(gradient: Gradient(colors: [.green, .white]), center: UnitPoint(x: 1, y: 0), startRadius: 5, endRadius: 280)).frame( height: 400)
                       
                }
                .blur(radius: 5)
                .blendMode(.multiply)
                .clipped()
                .cornerRadius(10)
               .offset(y: -280).padding(.top).ignoresSafeArea()

               
            }
        
        
            
            //LinearGradient(colors: [.blue, .purple, .cyan, .blue], startPoint: .leading, endPoint: .trailing).ignoresSafeArea()
            
                
            VStack {
                
                VStack {
                    Text(user.name ?? "George Burdell").foregroundColor(.white).font(.system(size: 30, weight: .bold))
                    Text(user.username ?? "@gburdell").foregroundColor(.white).font(.system(size: 25)).padding(.vertical, 0.1)
                    Text(user.major ?? "Computer Science").foregroundColor(.white).font(.system(size: 25)).padding(.vertical, 0.1)
                    Text((user.year ?? "3rd") + " year").foregroundColor(.white).font(.system(size: 25)).padding(.vertical, 0.1)
                    
                }.padding(.vertical, 30)
                
                
                
                VStack {
                    HStack {
                        Image(systemName: "gearshape.fill").font(.system(size: 25)).opacity(0)
                        Spacer().font(.system(size: 25))
                        Image("penguin").resizable().scaledToFill().frame(width: 130, height: 130).clipShape(Ellipse()).shadow(radius: 5,y: 4).overlay(Ellipse().stroke(.white, lineWidth: 4)).offset(y:  whiteBlockOffset < 600 ? -whiteBlockOffset + 600 : 0).frame(maxWidth: .infinity, alignment: .center).padding(.horizontal)
                        
                        Button(action: {
                            settingsPressed = true
                        }, label: {
                            Image(systemName: "gearshape.fill").font(.system(size: 25)).foregroundColor(.black)
                        }).padding([.top, .trailing])
                    }
                    
                    
                    VStack {
                        ScrollView(.vertical, showsIndicators: true) {
                            Text("Bio:").font(.system(size: 18, weight: .bold)).frame(maxWidth: .infinity, alignment: .leading).padding(.top).padding(.leading)
                            
                            Text(user.bio ?? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget blandit id nibh eget dolor tincidunt quis vitae. Donec cursus volutpat turpis sed.").multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                            Text("Tags:").font(.system(size: 18, weight: .bold)).frame(maxWidth: .infinity, alignment: .leading).padding(.top, 10).padding(.leading)
                            
                            TagView(tags: tags , fontSize: 15).frame(maxWidth: .infinity, alignment: .center)

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
                            }.padding(.bottom)
                                
                                
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
                }).navigationDestination(isPresented: $settingsPressed, destination: {
                    SettingsView().environmentObject(feedVM)
                })
                    
                }
                
            
            }
            
        
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(user: User(username: "", pfpDecoded: .init(), bio: "", contact: ["" : ""], interests: [.beginner : true], link: "", major: "", minor: "", name: "", sentRequests: ["" : ["" : true]], userID: "", year: "", projects: [])).environmentObject(FeedViewModel(userVM: UserViewModel()))
    }
}
