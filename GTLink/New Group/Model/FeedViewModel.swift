//
//  FeedViewModel.swift
//  GTLink
//
//  Created by Nicholas Candello on 11/6/22.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var selectedTags: [Tag] = []
    @Published var selectedType: Post_Type = .project
    
    @Published var showFilterSheet: Bool = false
    
}
