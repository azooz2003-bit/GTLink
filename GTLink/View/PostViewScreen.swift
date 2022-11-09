//
//  PostViewScreen.swift
//  GTLink
//
//  Created by rishi on 10/13/22.
//

import SwiftUI

var user: String = "gburdell"
var date: String = "10/11/22"
var title: String = "AppDev: GTLink"
var image: String = "xcode 1"
var description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

struct PostViewScreen: View  {
    @State var tags: [Tag] = [
        addTag(text: "iOS", fontSize: 16),
        addTag(text: "Developer", fontSize: 16),
        addTag(text: "Beginner", fontSize: 16),
        addTag(text: "Swift", fontSize: 16),
        addTag(text: "iOS Club", fontSize: 16),
        addTag(text: "UI/UX", fontSize: 16)
    ]
    
    var body: some View {
        VStack {
            titleCard()
            descriptionView()
            TagView(maxLimit: 150, tags: $tags)
                .padding(.top, 5)
            requestButton()
            Spacer()
        }
    }
}

struct titleCard: View {
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 180)
            Text(title)
                .fontWeight(.bold)
                .font(.title)
                .padding(5)
            HStack {
                Label(user, systemImage: "person.fill")
                    .padding(.leading)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Label(date, systemImage: "calendar.circle.fill")
                    .padding(.trailing)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom)
        }
    }
}

struct descriptionView: View {
    var body: some View {
        VStack {
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
        }
    }
}

struct requestButton: View {
    var body: some View {
        Button {
            print("Request Submitted!")
        } label: {
            Text("Send Request")
                .font(.title2)
                .padding([.top, .bottom], 15)
                .padding([.leading, .trailing], 55)
                .foregroundColor(.white)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(red: 62/255, green: 127/255, blue: 204/255), Color(red: 38/255, green: 87/255, blue: 145/255)]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(12)
        }
        .padding(10)
    }
}

struct PostViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostViewScreen()
    }
}
