//
//  PostViewScreen.swift
//  GTLink
//
//  Created by rishi on 10/13/22.
//

import SwiftUI



struct PostViewScreen: View  {
    @EnvironmentObject var feedVM: FeedViewModel
    
    @State var tags: [Tag] = [
        addTag(text: "iOS", color: .red, fontSize: 16),
        addTag(text: "Developer", color: .red, fontSize: 16),
        addTag(text: "Beginner", color: .red, fontSize: 16),
        addTag(text: "Swift", color: .red, fontSize: 16),
        addTag(text: "iOS Club", color: .red, fontSize: 16),
        addTag(text: "UI/UX", color: .red, fontSize: 16)
    ]
    
    var post: Post
    var owner: String
    var date: Date
    var title: String
    var image: UIImage
    var description: String
    
    init(post: Post) {
        self.post = post
        self.owner = post.owner
        self.date = post.date
        self.title = post.title
        self.image = post.image
        self.description = post.description
        self.tags = post.tags.map({addTag(text: $0.key.rawValue, color: $0.key.color, fontSize: 16)})
    }
    
    var body: some View {
        VStack {
            titleCard(image: image, title: title, date: date.formatted(date: .abbreviated, time: .omitted), owner: owner)
            descriptionView(description: description)
            TagView(tags: tags)
                .padding(.top, 5)
            requestButton()
            Spacer()
        }
    }
    
    @ViewBuilder
    func requestButton() -> some View {
        Button {
            feedVM.requestToJoinProject(posting: post) { success in
                if (success) {
                    print("Request successfuly sent")
                } else {
                    print("Request unsuccessfuly sent, BAD.")
                }
            }
            print("Request Clicked!")
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

struct titleCard: View {
    var image: UIImage
    var title: String
    var date: String
    var owner: String
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 180)
            Text(title)
                .fontWeight(.bold)
                .font(.title)
                .padding(5)
            HStack {
                Label(owner, systemImage: "person.fill")
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
    var description: String
    
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


struct PostViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostViewScreen(post: Post(postingID: "92570", title: "AppDev: GTLink", image: UIImage(imageLiteralResourceName: "xcode 1"), owner: "gburdell", date: Date(), description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", tags: [
            .beginner: true,
        ], isProject: true, isStudy: false, members: ["gburdell"], receivedRequests: [" " : [:]])).environmentObject(FeedViewModel(userVM: UserViewModel()))
    }
}
