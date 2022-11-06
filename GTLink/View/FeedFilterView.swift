//
//  FeedFilterView.swift
//  GTLink
//
//  Created by Nicholas Candello on 11/6/22.
//

import SwiftUI
import Foundation

struct FeedFilterView: View {
    
    @State private var tagsSelected: [Tag] = []
    @State private var projectType: String = "Project"
    
    init(tags: [Tag], projectType: String) {
        self.tagsSelected = tags
        self.projectType = projectType
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Capsule()
                .fill(Color.secondary)
                .frame(width: 30, height: 3)
                .padding(10)
            
            VStack(alignment: .leading) {
                Text("Tags")
                    .bold()
                    .font(.system(size: 20))
                VStack {
                    ForEach(Tag.allCases, id: \.hashValue) { tag in
                        Text(tag.rawValue).padding(10).background(tag.color).cornerRadius(15)
                    }
                }.foregroundColor(.white)
                .font(.system(size: 16))
            }
            
        }
    }
    
}

struct FeedFilterView_Previews: PreviewProvider {
    static var previews: some View {
        FeedFilterView(tags: [Tag.homework, Tag.cs1301, Tag.cs1999], projectType: "Project")
    }
}
