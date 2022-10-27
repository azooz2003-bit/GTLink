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
                // Title text field
                TextField("Title", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                Divider()
                    .frame(width: 200, height: 2)
                    .background(Color.black.opacity(0.2))
                // Username and date
                HStack {
                    Image(systemName: "person")
                        .padding(.leading, 20)
                        .foregroundColor(.black)
                        .font(.system(size: 20.0))
                    Text("gburdell")
                    Text(Date(), style: .date)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 20)
                }
                .padding(.top, 20)
                // Description
                VStack {
                    Text("Description")
                        .multilineTextAlignment(.leading)
                        .underline()
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter project description here.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                // Select post type
                VStack {
                    Text("Category")
                        .multilineTextAlignment(.leading)
                        .underline()
                        .padding(.top, 50)
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Button("Study") {
                            print("Project button clicked.")
                        }
                        .frame(width: 90, height: 30)
                        .foregroundColor(Color.black)
                        .overlay(RoundedRectangle(cornerRadius: 25) .stroke(Color.black) )
                        .padding(.leading, 20)
                        
                        Button("Project") {
                            print("Project button clicked.")
                        }
                        .frame(width: 90, height: 30)
                        .foregroundColor(Color.black)
                        .overlay(RoundedRectangle(cornerRadius: 25) .stroke(Color.black) )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                // Additional Information
                VStack {
                    Text("Additional Information")
                        .multilineTextAlignment(.leading)
                        .underline()
                        .padding(.top, 50)
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter any additional information here.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Button("Post") {
                    print("Next button clicked.")
                }
                    .frame(width: 120, height: 50)
                    .foregroundColor(Color.black)
                    .overlay(RoundedRectangle(cornerRadius: 25) .stroke(Color.black) )
                    .padding(.top, 20)
                
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
                                Text("Create a Post").font(.system(size: 25, weight: .bold))
                                    .font(.largeTitle.bold())
                                    .accessibilityAddTraits(.isHeader)
                                Spacer()
                            }
                        }
                    }
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
