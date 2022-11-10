//
//  FeedViewModel.swift
//  GTLink
//
//  Created by Nicholas Candello on 11/6/22.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var selectedTags: [Tags] = []
    @Published var selectedType: Post_Type = .project
    
    @Published var showFilterSheet: Bool = false
    
}
