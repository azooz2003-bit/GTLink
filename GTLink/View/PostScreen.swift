//
//  FeedScreen.swift
//  GTLink
//
//  Created by Amit Kulkarni on 10/13/22.
//

import SwiftUI

extension View {
     public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
         let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
         return clipShape(roundedRect)
              .overlay(roundedRect.strokeBorder(content, lineWidth: width))
     }
 }

struct PostScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(red:0.882, green: 0.882, blue: 0.882))
                        .frame(height: 200)
                    
                        Button(action: {
                            print("button clicked")
                        }) {
                            HStack {
                                Image(systemName: "photo")
                                Text("Add Image").font(.system(size: 17, weight: .bold))
                            }
                            .padding(.leading,25)
                            .padding(.bottom, 5)
                            .padding(.top, 5)
                            .padding(.trailing,25)
                            .foregroundColor((Color(red:0.709, green: 0.709, blue: 0.709)))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red:0.709, green: 0.709, blue: 0.709), lineWidth: 2)
                            )
                            .background(.white, in: RoundedRectangle(cornerRadius: 10))
                        }

//                    RoundedRectangle(cornerRadius: 10)
//                        .background(RoundedRectangle(cornerRadius: 4.0).stroke(Color.red, lineWidth: 4))
//                        .fill(Color(red:0.93, green: 0.93, blue: 0.93))
//                        .frame(width: 181, height: 39)
                }
                Spacer()
            }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                                    .bold()
                                    .scaleEffect(1.2)
                                Spacer()
                                Text("Create a Post").font(.system(size: 30, weight: .bold))
                                    .font(.largeTitle.bold())
                                    .accessibilityAddTraits(.isHeader)
                                Spacer()
                            }
                        }
                    }
        }
        VStack {
            Text("HEllo")
        }

    }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostScreen()
    }
}


//            Text("Create a Post").font(.system(size: 30, weight: .bold))
//            .navigationTitle("Create a Post")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//
//                    } label: {
//                        Image(systemName: "arrow.left")
//                            .foregroundColor(.black)
//                            .bold()
//                    }
//                }
//            }
//            .navigationBarItems(leading: Button(action: { }) {
//                HStack {
//                    Image(systemName: "arrow.left")
//                        .foregroundColor(.black)
//                        .bold()
//                }
//            })
