//
//  FeedFilterView.swift
//  GTLink
//
//  Created by Nicholas Candello on 11/6/22.
//

import SwiftUI
import Foundation

struct FeedFilterView: View {
    
    @State private var tagsSelected: [Tag]
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
                        Button(action: {
                            buttonClicked(tag: tag)
                        }, label: { Text(tag.rawValue).padding(10).background(tagsSelected.contains(tag) ? tag.color : Color.white).cornerRadius(15).foregroundColor( tagsSelected.contains(tag) ? Color.white : Color(red: 121/255, green: 121/255, blue: 121/255))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(tagsSelected.contains(tag) ? Color.clear : tag.color)
                                )
                        })
                    }
                }
                .font(.system(size: 16))
            }.frame(width: UIScreen.main.bounds.size.width)
            
        }
    }
    func buttonClicked(tag: Tag) {
        if(tagsSelected.contains(tag)) {
            tagsSelected.removeAll { thisTag in
                thisTag == tag
            }
        } else {
            tagsSelected.append(tag)
        }
    }
}

struct FeedFilterView_Previews: PreviewProvider {
    static var previews: some View {
        FeedFilterView(tags: [Tag.homework, Tag.cs1301, Tag.cs1999, Tag.ios, Tag.designer], projectType: "Project")
    }
}
