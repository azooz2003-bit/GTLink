//
//  TagView.swift
//  GTLink
//
//  Created by rishi on 11/1/22.
//

import SwiftUI

struct Tag: Identifiable, Hashable {
    let id = UUID().uuidString
    var color: Color
    var text: String
    var size: CGFloat = 0
}

struct TagView: View {
    //var maxLimit: Int
    var tags: [Tag]
    
    var fontSize: CGFloat = 16
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            /*
            Text("Tags")
                .font(.title3)
                .underline()
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)*/
            // commenting this out so that it can be used across the app
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    // diplaying tags
                    ForEach(getRows(), id: \.self) { rows in
                        HStack(spacing: 6) {
                            ForEach(rows) { row in
                                RowView(tag: row)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            
            // uncomment to see border of where the tags are displayed
            /*
            .background (
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.black)
            )
            */
            .padding(10)
        }
//        .onChange(of: tags) { newValue in
//        }
    }
    
    @ViewBuilder
    func RowView(tag: Tag) -> some View {
        // applying same font size
        // else size will vary
        Text(tag.text)
            .font(.system(size: fontSize))
        // adding capsule
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background (
                // need to figure out how to classify specific tags by color and implement it here or may need to add parameter to each Tag instance
                Capsule()
                    .fill(tag.color)
            )
            .foregroundColor(.white)
            .lineLimit(1)
        // deleting
            .contentShape(Capsule())
//            .contextMenu {
//                Button("Delete") {
//                    tags.remove(at: getIndex(tag: tag))
//                }
//            }
    }
    
    func getIndex(tag: Tag) -> Int {
        let index = tags.firstIndex { currentTag in
            return tag.id == currentTag.id
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
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 30
        
        
        tags.forEach { tag in
            // updating total width
            // adding capsule size to total width with spacing
            totalWidth += (tag.size + 40) // accounting for horizontal spaces
            
            if totalWidth > screenWidth {
                // adding row in rows
                // clearing out data
                // checking for long string
                totalWidth = (!currentRow.isEmpty || rows.isEmpty ? (tag.size + 40) : 0)
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
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        PostViewScreen(post: Post(postingID: "92570", title: "AppDev: GTLink", image: UIImage(imageLiteralResourceName: "xcode 1"), owner: "gburdell", date: Date(), description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", tags: [
            .beginner: true,
        ], isProject: true, isStudy: false, members: ["gburdell"], receivedRequests: [" " : [:]]))
    }
}

// global addtag function
func addTag(text: String, color: Color, fontSize: CGFloat) -> Tag {
    
    // getting text size
    let font = UIFont.systemFont(ofSize: fontSize)
    let attributes = [NSAttributedString.Key.font: font]
    let size = (text as NSString).size(withAttributes: attributes)
    
    return Tag(color: color, text: text, size: size.width)
}
