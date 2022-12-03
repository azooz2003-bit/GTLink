//
//  LandingPage.swift
//  GTLink
//
//  Created by Daniel Yu on 10/25/22.
//

import SwiftUI

struct LandingPagev1: View {
    @EnvironmentObject var userVM : UserViewModel
    @State var navigate  = false
    
    var body: some View {
        VStack {
            Text("GT Link")
                .font(.system(size: 60))
                .padding(30)
            Spacer()
                .frame(height:170)
            
            // Use the exact icons as in Figma. Not emojis.
            Text("❖ Create/Join Project Teams")
                .padding(10)
                .offset(x: 0)
                .foregroundColor(.black)
                .font(.system(size: 20))
            
            // same here
            Text("➠ Form Study Groups")
                .padding(10)
                .foregroundColor(.black)
                .font(.system(size: 20))
                .offset(x: -25)
            
            // same here
            Text("↹ Connect with Students")
                .padding(10)
                .foregroundColor(.black)
                .font(.system(size: 20))
                .offset(x: -12)
            
            Spacer()
            Button(action: {
                loginWithProvider() { success in
                    navigate = success
                }
            }) {
                    Image("GT")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    // Good job with choosing an HStack. Now find a way to contain the image, text, arrow, with proper spacing.
                    Text("Georgia Tech SSO ➩  ")
                        .foregroundColor(.white)
                        .font(.custom(
                            "AmericanTypewriter",
                            fixedSize: 25))
                // ^ NOTE: change the font so that it matches the design! OR instead of .custom(), have a look at .system(size:weight:design:) or some other variation. Don't use the arrow emoji as an icon!
                    // If you go to Figma, you can "export" the specific arrow used as an SVG file. Saves you the hassle of finding a similar arrow.
                    // Label component may be useful here
                }
                .background(Color.black)
                .cornerRadius(15)
                .frame(height: 60)
                .padding(-100)
            }
        }
        .navigationDestination(isPresented: $navigate, destination: {
    }
}

struct LandingPagev1_Previews: PreviewProvider {
    static var previews: some View {
        LandingPagev1()
    }
}
