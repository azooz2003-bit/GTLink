//
//  TabRouter.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 12/28/22.
//

import Foundation

class TabRouter: ObservableObject {
    
    @Published var screen: Screen = .ProfileScreen
    
    func change(to screen: Screen) {
        
        self.screen = screen
    }
    
}
