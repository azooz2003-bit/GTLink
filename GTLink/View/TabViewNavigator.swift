//
//  TabViewNavigator.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 12/28/22.
//

import SwiftUI

enum Screen: CaseIterable {
    case FeedScreen
    case RequestsView
    case ProfileScreen
    
    var icon: String {
        var i: String
        switch self {
        case .FeedScreen:
            i = "feedIcon" // icon name
        case .ProfileScreen:
            i = "profileIcon"
        case .RequestsView:
            i = "settingsIcon"
        
        }
        
        return i
    }
    
}

struct TabViewNavigator: View {
    @StateObject var router = TabRouter()
        //@EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var feedVM: FeedViewModel
    
    var body: some View {
        
        ZStack {
            ZStack {
                switch router.screen {
                case .FeedScreen:
                    withAnimation {
                        NavigationView {
                            VStack {
                                FeedScreen().environmentObject(feedVM)
                            }
                        }
                    }
                    
                
                    
                case .RequestsView:
                    withAnimation {
                        NavigationView {
                            VStack {
                                SettingsView().environmentObject(feedVM)
                            }
                        }
                    }
                    
                case .ProfileScreen:
                    let user = feedVM.userVM.user
                    withAnimation {
                        NavigationView {
                            VStack {
                                ProfilePage(user: user!).environmentObject(feedVM)
                            }
                        }
                    }
                }
                
                
                
            }
            
            //Divider()
            VStack {
                HStack {
                    ForEach(Screen.allCases, id: \.self) { screen in
                        
                        Spacer()
                        Button(action: {
                            
                            withAnimation {
                                router.change(to: screen)
                                feedVM.syncFeedData { success in
                                    if success {
                                        feedVM.assignRequests { success in
                                            print("Assign requests was successful: \(success)")
                                        }
                                    }
                                    //print(fvm.allPostings![0].title)
                                }
                            }
                        }) {
                            ZStack {
                                screen != router.screen ? AnyView(EmptyView().cornerRadius(6).frame(width: 50, height: 50)) : AnyView(Rectangle().frame(width: 50, height: 50).overlay(
                                    LinearGradient(gradient: Gradient(colors: [Color.init(red: 62 / 255, green: 127 / 255, blue: 204 / 255), Color.init(red: 38 / 255, green: 87 / 255, blue: 145 / 255)]), startPoint: .leading, endPoint: .trailing)
                                ).cornerRadius(6))
                                Image(screen == router.screen ? screen.icon + "Selected" : screen.icon).font(.system(size: 25, weight: .regular, design: .default))
                            }.frame(width: 50, height: 50).padding(.vertical, 10)
                            
                            
                        }
                        Spacer()
                    }
                }.background(content: {
                    Color.white
                }).cornerRadius(20).shadow(radius: 4, x: 0, y: 0).padding(25)
            }.frame(maxHeight: .infinity, alignment: .bottom)
            
        }.ignoresSafeArea()
        
        
        
    }
}

struct TabViewNavigator_Previews: PreviewProvider {
    static var previews: some View {
        TabViewNavigator().environmentObject(FeedViewModel(userVM: UserViewModel()))
    }
}
