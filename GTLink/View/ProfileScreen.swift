//
//  ProfileScreen.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 11/26/22.
//

import SwiftUI

@MainActor
class ScrollItemManager: ObservableObject {
    @Published var bioHeadOffset: CGFloat = 0
    @Published var bioTextOffset: CGFloat = 0
    @Published var tagsHeadOffset: CGFloat = 0
    @Published var tagsOffset: CGFloat = 0
    @Published var cardsToggleOffset: CGFloat = 0
    @Published var cardsOffset: [CGFloat] = []


}

struct ProfileScreen: View {
    @StateObject var scrollIM = ScrollItemManager()
    
    @State var infoOffset: CGFloat = 0
    @State var whiteBlockOffset: CGFloat = 0
    @State var blockItemsOffset: CGFloat = 0
    @State var tags = [
        addTag(text: "iOS", fontSize: 16),
        addTag(text: "Developer", fontSize: 16),
        addTag(text: "Beginner", fontSize: 16),
        addTag(text: "Swift", fontSize: 16),
        addTag(text: "iOS Club", fontSize: 16),
        addTag(text: "UI/UX", fontSize: 16)
    ]
    @State var activeClicked = true
    
    var body: some View {
        
        
        ZStack {
            LinearGradient(colors: [.blue, .purple, .cyan, .blue], startPoint: .leading, endPoint: .trailing).ignoresSafeArea()
            
            VStack(spacing: 7) {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 7) {
                        
                        Text("George Burdell").foregroundColor(.white).font(.system(size: 30, weight: .bold))
                        Text("@gburdell").foregroundColor(.white).font(.system(size: 25))
                        Text("Computer Science").foregroundColor(.white).font(.system(size: 25))
                        Text("3rd year").foregroundColor(.white).font(.system(size: 25))
                        
                    }.padding(.vertical, 40).offset(y: infoOffset < 140 ? -infoOffset + 140 : 0).overlay {
                        
                        GeometryReader { coords -> Color in
                            let minY = coords.frame(in: .global).minY
                            
                            DispatchQueue.main.async {
                                
                                self.infoOffset = minY
                            }
                            return Color.clear
                        }.frame(width: 0, height: 0) // to replicate empty view
                        
                        
                    }
                    
                    
                    
                        
                        
                    
                    VStack {
                        Image("penguin").resizable().scaledToFill().frame(width: 130, height: 130).clipShape(Ellipse()).overlay(Ellipse().stroke(.white, lineWidth: 4)).offset(y:  whiteBlockOffset < 850 ? -whiteBlockOffset + 850 : 0)
                         
                        VStack {
                            Text("Bio:").zIndex(0).font(.system(size: 18, weight: .bold)).frame(maxWidth: .infinity, alignment: .leading).padding(.top).overlay {
                                
                                GeometryReader { coords -> Color in
                                    let minY = coords.frame(in: .global).minY
                                    
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            self.scrollIM.bioHeadOffset = minY
                                        }
                                    }
                                    
                                    return Color.clear
                                }.frame(width: 0, height: 0) // to replicate empty view
                                
                            }.scrollHide(currOffset: scrollIM.bioHeadOffset)
                            
                            
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget blandit id nibh eget dolor tincidunt quis vitae. Donec cursus volutpat turpis sed.").multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading).overlay {
                                
                                GeometryReader { coords -> Color in
                                    let minY = coords.frame(in: .global).minY
                                    DispatchQueue.main.async {
                                        
                                        self.scrollIM.bioTextOffset = minY
                                    }
                                    return Color.clear
                                }.frame(width: 0, height: 0) // to replicate empty view
                                
                                
                            }.scrollHide(currOffset: scrollIM.bioTextOffset)
                            Text("Tags:").font(.system(size: 18, weight: .bold)).frame(maxWidth: .infinity, alignment: .leading).padding(.top, 10).overlay {
                                
                                GeometryReader { coords -> Color in
                                    let minY = coords.frame(in: .global).minY
                                    
                                    DispatchQueue.main.async {
                                        
                                        self.scrollIM.tagsHeadOffset = minY
                                    }
                                    return Color.clear
                                }.frame(width: 0, height: 0) // to replicate empty view
                                
                                
                            }.scrollHide(currOffset: scrollIM.tagsHeadOffset)
                            //TagView(tags: $tags, fontSize: 15)
                            
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
                            }.padding(.vertical).overlay {
                                
                                GeometryReader { coords -> Color in
                                    let minY = coords.frame(in: .global).minY
                                    
                                    DispatchQueue.main.async {
                                        
                                        self.scrollIM.cardsToggleOffset = minY
                                    }
                                    return Color.clear
                                }.frame(width: 0, height: 0) // to replicate empty view
                                
                                
                            }.scrollHide(currOffset: scrollIM.cardsToggleOffset)
                            
                            VStack {
                                Card(post_picture: Image("penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus, Tags.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.").padding(.bottom).zIndex(blockItemsOffset < 780 ? 0: 2).overlay {
                                    GeometryReader { coords -> Color in
                                        let minY = coords.frame(in: .global).minY

                                        DispatchQueue.main.async {
                                            if (scrollIM.cardsOffset.count > 0) {
                                                scrollIM.cardsOffset[0] = minY
                                            } else {
                                                scrollIM.cardsOffset.append(minY)
                                            }
                                        }
                                        
                                        return Color.clear
                                    }.frame(width: 0, height: 0)
                                }.scrollHide(currOffset: scrollIM.cardsOffset.count > 0 ? scrollIM.cardsOffset[0] : 0)
                                
                                Card(post_picture: Image("penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus, Tags.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.").padding(.bottom).zIndex(blockItemsOffset < 780 ? 0: 2).overlay {
                                    GeometryReader { coords -> Color in
                                        let minY = coords.frame(in: .global).minY

                                        DispatchQueue.main.async {
                                            if (scrollIM.cardsOffset.count > 1) {
                                                scrollIM.cardsOffset[1] = minY
                                            } else {
                                                scrollIM.cardsOffset.append(minY)
                                            }
                                        }
                                        
                                        return Color.clear
                                    }.frame(width: 0, height: 0)
                                }.scrollHide(currOffset: scrollIM.cardsOffset.count > 1 ? scrollIM.cardsOffset[1] : 0)
                                
                                Card(post_picture: Image("penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus, Tags.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.").padding(.bottom).overlay {
                                    GeometryReader { coords -> Color in
                                        let minY = coords.frame(in: .global).minY

                                        DispatchQueue.main.async {
                                            if (scrollIM.cardsOffset.count > 2) {
                                                scrollIM.cardsOffset[2] = minY
                                            } else {
                                                scrollIM.cardsOffset.append(minY)
                                            }
                                        }
                                        
                                        return Color.clear
                                    }.frame(width: 0, height: 0)
                                }.scrollHide(currOffset: scrollIM.cardsOffset.count > 2 ? scrollIM.cardsOffset[2] : 0)
                                
                                Card(post_picture: Image("penguin"), title: "CS 1999: Exam 1 Study", username: "gburdell", post_date: Date(), tags: [Tags.class_project, Tags.c_cplusplus, Tags.cs1301], description: "Lorem ipsum dolor sit amet, sed do eiusmod tempor quis nos vas de roma.").padding(.bottom).overlay {
                                    GeometryReader { coords -> Color in
                                        let minY = coords.frame(in: .global).minY
                                        
                                        DispatchQueue.main.async {
                                            
                                            if (scrollIM.cardsOffset.count > 3) {
                                                scrollIM.cardsOffset[3] = minY
                                            } else {
                                                scrollIM.cardsOffset.append(minY)
                                                
                                            }
                                        }
                                    
                                        return Color.clear
                                    }.frame(width: 0, height: 0)
                                }.scrollHide(currOffset: scrollIM.cardsOffset.count > 3 ? scrollIM.cardsOffset[3] : 0)
                            }.padding(.bottom, 100)
                            
                        }
    
                        
                    }.padding(.horizontal, 25).background(content: {
                        Color.white.cornerRadius(30).offset(y: whiteBlockOffset < 850 ? -whiteBlockOffset + 850 : 0).overlay {
                            
                            GeometryReader { coords -> Color in
                                let minY = coords.frame(in: .global).minY
                                
                                DispatchQueue.main.async {
                                    self.whiteBlockOffset = minY
                                }
                                
                                return Color.clear
                            }.frame(width: 0, height: 0) // to replicate empty view
                            
                            
                        }.padding(.top, 60)
                    })
                        
                        
                        
                    
                    
                }
                
            }
            
            
        }
        
    }
}

extension View {
    
    @ViewBuilder
    func scrollHide(currOffset: CGFloat) -> some View {
        let minOffset: CGFloat = 350
        if (currOffset < minOffset) {
            self.transition(.asymmetric(insertion: .scale, removal: .opacity)).hidden().disabled(true)
        } else {
            self
        }
        
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
