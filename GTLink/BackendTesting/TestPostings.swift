//
//  TestPostings.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 12/6/22.
//

import SwiftUI

struct TestPostings: View {
    @StateObject var fvm = FeedViewModel(userVM: UserViewModel())
    @State var showpostings = false
    
    var body: some View {
        VStack {
            Button(action: {
                fvm.syncFeedData { success in
                    showpostings = success
                    print(fvm.allPostings![0].title)
                }
            }) {
                Text("Press me")
            }
            if (showpostings) {
                ForEach(fvm.allPostings!, id: \.self.id) { post in
                    
                        Text(post.description).background(.blue).frame(width:100, height: 100).onAppear {
                        print("appeared")
                    }
                }
            }
        }
        
        
        
        
        
    }
}

struct TestPostings_Previews: PreviewProvider {
    static var previews: some View {
        TestPostings()
    }
}
