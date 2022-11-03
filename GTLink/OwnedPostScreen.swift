//
//  OwnedPostScreen.swift
//  GTLink
//
//  Created by Ria Patel on 10/25/22.
//

import SwiftUI

struct OwnedPostScreen: View {
    let tags: [String] = ["C/C++","Developer","Beginner"]
    
    let tagColors: [Color] = [Color.init(red: 0 / 255, green: 163 / 255, blue: 255 / 255), Color.init(red: 5 / 255, green: 0 / 255, blue: 252 / 255), Color.init(red: 255 / 255, green: 153 / 255, blue: 0 / 255)]
    
    var body: some View {
        let columns = [
                GridItem(.fixed(100)),
                GridItem(.flexible()),
            ]
        VStack(alignment: .center) {
            Image("programming evolution")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 158, alignment: .center)
                .border(Color.black)
                .clipped()
                
            Text("Type of Project: Title")
                .fontWeight(.heavy)
                .font(.system(size: 28))
                .padding(.top, 18)
            HStack {
                Image("icons8-customer-96 2")
                    .padding(.leading, 15)
                Text("gburdell")
                    .font(.system(size: 16))
                Spacer()
                Text("10/11/22")
                    .font(.system(size: 16))
                    .padding(.trailing,15)
            }
            Text("Description")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .underline()
                .padding(.top, 26)
                .padding(.leading, 20)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                .padding(.top,1)
                .padding(.horizontal,20)
            VStack {
                Text("Tags")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .underline()
                    .padding(.top, 16)
                    .padding(.leading, 20)
    //            LazyVGrid(columns: columns, spacing: 20) {
    //                            ForEach(data, id: \.self) { item in
    //                                Text(item)
    //                            }
    //                        }
                
                let rows: [GridItem] =
                Array(repeating: .init(.flexible()), count: 1)
                LazyHGrid.init(rows: rows, alignment: .top) {
                    ForEach(0..<tags.endIndex) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 7, style: .continuous)
                                .fill(tagColors[index])
                                .frame(height: 27)
                            Text(tags[index])
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                                .padding(.horizontal, 12)
                        }
                        
                        
                    }
                }
//               dont know how to make it leading!!!

            }
            
            Spacer()
            HStack(alignment: .center) {
                Button(action: {}) {
                    Text("Edit")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .bold()
                        .padding(.horizontal, 37)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 1)
                            )
                }
                Button(action: {}) {
                    Text("Delete")
                        .foregroundColor(.red)
                        .font(.system(size: 18))
                        .bold()
                        .padding(.horizontal, 37)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.red, lineWidth: 1)
                            )
                }
                // Great job. Add a little padding to the bottom of the buttons, otherwise when you open up smaller iphone screens, it looks weird.
                
                

            }
            
            
        }
    }
}

struct OwnedPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        OwnedPostScreen()
    }
}
