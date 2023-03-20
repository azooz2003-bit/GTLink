//
//  CreateProfile2.swift
//  GTLink
//
//  Created by River Pease on 11/3/22.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct CreateProfile2: View {
    @EnvironmentObject var userVM : UserViewModel

    @State var fullName: String = ""
    @State var userName: String = ""
    @State var bio: String = ""
    @State var navigateNext = false

    
    var body: some View {
        
        VStack {
            
            // Back button
            Button(action: {}){
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25).foregroundColor(Color.black)

            }
            .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 30).padding(.vertical, 20).offset(y: 10)
            
            // Step 1/4
            Text("Step 1/4").frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20)).padding(.leading, 35)
                
            
            // Title
            Text("Let's start with the basics.")
                .frame(maxWidth: .infinity, alignment: .leading)           .font(.system(size: 27))
                .bold().padding(.leading, 35)
            
            // Image
            Image("background").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 170)
                .padding(.vertical, 30)
            
            // Full Name
            TextField("Full Name", text: $fullName)
                .frame(width: 280, height: 50)
                .padding(.horizontal, 20)
                .overlay(RoundedRectangle(cornerRadius: 15) .stroke(Color.black) )
                .padding(.vertical, 5)
                
            
            // Username
            TextField("Username", text: $userName)
                .frame(width: 280, height: 50)
                .padding(.horizontal, 20)
                .overlay(RoundedRectangle(cornerRadius: 15) .stroke(Color.black) )
                .padding(.vertical, 5)
            
            // Description
            TextField("Description/Bio", text: $bio, axis: .vertical)
                .frame(width: 280, height: 150, alignment: .top)
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 15) .stroke(Color.black) )
                .padding(.vertical, 5).lineLimit(8)
            
            // Next button
            Button(action: {
                userVM.assignUserDataLocally(data: ["name" : fullName, "bio" : bio]) { success1 in
                        userVM.addProfileData { success2 in
                            navigateNext = success2
                        }
                }
                
            }){
                Text("Next")
                    .font(.system(size: 24))
                    .foregroundColor(.white).padding(.horizontal, 133)
                    .padding(.vertical, 10)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.init(red: 71 / 255, green: 103 / 255, blue: 204 / 255), Color.init(red: 90 / 255, green: 186 / 255, blue: 255 / 255)]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
            }
            .padding(.vertical, 30)
        }.navigationDestination(isPresented: $navigateNext, destination: {
            CreateProfile2_4().environmentObject(userVM).navigationBarBackButtonHidden()
        })
        
    }
}

struct CreateProfile2_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfile2().environmentObject(UserViewModel())
    }
}
