//
//  PostViewScreen.swift
//  GTLink
//
//  Created by rishi on 10/13/22.
//

import SwiftUI

struct Tag: Identifiable {
    let id = UUID()
    var name: String
    var category: String
    var color: Color
}

struct PostViewScreen: View {
    var user: String = "gburdell"
    var date: String = "10/11/22"
    var title: String = "AppDev: GTLink"
    var image: String = "xcode 1"
    var description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    var tags = [
        Tag(name: "Swift", category: "Language", color: .blue),
        Tag(name: "iOS Club", category: "Course", color: .purple),
        Tag(name: "Beginner", category: "Experience", color: .orange),
        Tag(name: "Designer", category: "Role", color: .pink),
        Tag(name: "UI/UX", category: "Role", color: .pink),
        Tag(name: "Database", category: "Role", color: .pink),
    ]
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 390, height: 180)
                .cornerRadius(30)
            Text(title)
                .fontWeight(.bold)
                .font(.title)
                .padding(5)
            HStack {
                Label(user, systemImage: "person")
                    .padding(.leading)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Label(date, systemImage: "calendar")
                    .padding(.trailing)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom)
            Text("Description")
                .font(.title3)
                .underline()
                .padding(.leading)
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(description)
                .padding(.top, 5)
                .padding([.leading, .trailing], 15)
                .font(.callout)
            Text("Tags")
                .font(.title3)
                .underline()
                .padding(.top, 10)
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(tags) { tag in
                        Text(tag.name)
                            .font(.subheadline)
                            .padding([.top, .bottom], 10)
                            .padding([.leading, .trailing], 20)
                            .foregroundColor(.white)
                            .background(tag.color)
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                            .fixedSize(horizontal: true, vertical: false)
                        Spacer(minLength: 10)
                    }
                }
                .padding(5)
            }
            Button {
                print("Request Submitted!")
            } label: {
                Text("Send Request")
                    .font(.title2)
                    .padding([.top, .bottom], 15)
                    .padding([.leading, .trailing], 55)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
            .padding(55)
            Spacer()
        }
    }
}

struct PostViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostViewScreen()
    }
}
