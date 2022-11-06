//
//  FeedFilterView.swift
//  GTLink
//
//  Created by Nicholas Candello on 11/6/22.
//

import SwiftUI

struct FeedFilterView: View {
    
    @State private var tagsSelected: [Tag] = []
    @State private var projectType: String = "Project"
    
    init(tags: [Tag], projectType: String) {
        self.tagsSelected = tags
        self.projectType = projectType
    }
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.secondary)
                .frame(width: 30, height: 3)
                .padding(10)
            
            VStack {
                
            }
            
        }
    }
}

struct FeedFilterView_Previews: PreviewProvider {
    static var previews: some View {
        FeedFilterView(tags: <#[Tag]#>, projectType: <#String#>)
    }
}
