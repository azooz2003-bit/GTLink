//
//  CreateProfile4-4.swift
//  GTLink
//
//  Created by Ria Patel on 11/10/22.
//

import SwiftUI

struct CreateProfile4_4: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Step 3/4")
                    .font(.system(size: 20))
                    .padding(.leading, 30)
                Spacer()
            }
            HStack {
                Text("Select a few of your interests.")
                    .font(.system(size: 26))
                    .fontWeight(.medium)
                    .padding(.leading, 30)
                Spacer()
            }
            Image("Group_15")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 61)
                .padding(.top, 29)
            
            
            
            Spacer()
            Button(action: {}){
                Text("Next")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    
            }
            .padding(.horizontal, 133)
            .padding(.vertical, 10)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.init(red: 62 / 255, green: 127 / 255, blue: 204 / 255), Color.init(red: 38 / 255, green: 87 / 255, blue: 145 / 255)]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(10)
        }
    }
}

struct CreateProfile4_4_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfile4_4()
    }
}
