//
//  FeedScreen.swift
//  GTLink
//
//  Created by Amit Kulkarni on 10/13/22.
//

import SwiftUI

struct PostScreen: View {
    var body: some View {
        NavigationView {
            Text("Hello, SwiftUI!")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                                    .bold()
                                Spacer()
                                Text("Create a Post").font(.system(size: 30, weight: .bold))
                                    .font(.largeTitle.bold())
                                    .accessibilityAddTraits(.isHeader)
                                Spacer()
                            }
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
            
        }
    }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostScreen()
    }
}
