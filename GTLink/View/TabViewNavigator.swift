//
//  TabViewNavigator.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 12/28/22.
//

import SwiftUI

enum Screen: CaseIterable {
    case FeedScreen
    case ProfileScreen
    case SettingsView
    
    var icon: String {
        var i: String
        switch self {
        case .FeedScreen:
            i = "feedIcon" // icon name
        case .ProfileScreen:
            i = "profileIcon"
        case .SettingsView:
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
        
        VStack {
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
                    
                case .ProfileScreen:
                    withAnimation {
                        NavigationView {
                            VStack {
                                ProfileScreen().environmentObject(feedVM)
                            }
                        }
                    }
                    
                case .SettingsView:
                    withAnimation {
                        NavigationView {
                            VStack {
                                SettingsView().environmentObject(feedVM)
                            }
                        }
                    }
                }
                
            }
            
            Divider()
            HStack {
                ForEach(Screen.allCases, id: \.self) { screen in
                    
                    Spacer()
                    Button(action: {
                        
                        withAnimation {
                            router.change(to: screen)
                        }
                    }) {
                        Image(systemName: screen.icon).overlay(screen != router.screen ? AnyView(EmptyView()) : AnyView(Rectangle().cornerRadius(6).opacity(0.3).frame(width: 50, height: 50))).font(.system(size: 25, weight: .regular, design: .default)).padding(.top).foregroundColor(Color(LinearGradient(gradient: Gradient(colors: [Color.init(red: 62 / 255, green: 127 / 255, blue: 204 / 255), Color.init(red: 38 / 255, green: 87 / 255, blue: 145 / 255)]), startPoint: .leading, endPoint: .trailing) as! CGColor))
                    }
                    Spacer()
                }
            }
        }
        
        
        
    }
}

struct TabViewNavigator_Previews: PreviewProvider {
    static var previews: some View {
        TabViewNavigator().environmentObject(FeedViewModel(userVM: UserViewModel()))
    }
}
