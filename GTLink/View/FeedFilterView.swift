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
                VStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading, spacing: 10) {
                            
                            // diplaying tags
                            ForEach(getRows(), id: \.self) { rows in
                                HStack(spacing: 6) {
                                    ForEach(rows, id: \.hashValue) { row in
                                        RowView(tag: row)
                                    }
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                    
                    // uncomment to see border of where the tags are displayed
                    /*
                     .background (
                     RoundedRectangle(cornerRadius: 8)
                     .strokeBorder(.black)
                     )
                     */
                    .padding(10)
                }
                .font(.system(size: 16))
            }.frame(width: UIScreen.main.bounds.size.width)
            Spacer()
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
    @ViewBuilder
    func RowView(tag: Tag) -> some View {
        // applying same font size
        // else size will vary
        VStack {
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
    
    func getIndex(tag: Tag) -> Int {
        let index = Tag.allCases.firstIndex { currentTag in
            return tag.hashValue == currentTag.hashValue
        } ?? 0
        return index
    }
    
    // basic logic
    // splitting array when it exceeds screen size
    func getRows() -> [[Tag]] {
        var rows: [[Tag]] = []
        var currentRow: [Tag] = [] // tags row with empty spots
        
        // calculating text width
        var totalWidth: CGFloat = 0
        // if issues occurs with tags now showing properly or cutting off change 30 to 40
        let screenWidth: CGFloat = UIScreen.main.bounds.size.width - 30
        
        
        Tag.allCases.forEach { tag in
            // updating total width
            // adding capsule size to total width with spacing
            totalWidth += (getSize(tag: tag)) // accounting for horizontal spaces
            
            if totalWidth > screenWidth {
                // adding row in rows
                // clearing out data
                // checking for long string
                totalWidth = (!currentRow.isEmpty || rows.isEmpty ? (getSize(tag: tag) + 20) : 0)
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
            } else {
                currentRow.append(tag)
            }
        }
        if !currentRow.isEmpty {
            rows.append(currentRow) // appending current row after adding new tag to it
            //currentRow.removeAll()
        }
        
        return rows
    }
    
    func getSize(tag: Tag) -> CGFloat {
        let tagName = tag.rawValue
        let size: CGSize = tagName.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16)])
        
        
        return size.width + 20
    }
}

struct FeedFilterView_Previews: PreviewProvider {
    static var previews: some View {
        FeedFilterView(tags: [Tag.homework, Tag.cs1301, Tag.ios, Tag.designer], projectType: "Project")
    }
}
