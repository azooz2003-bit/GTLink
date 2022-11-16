//
//  ProgressBar.swift
//  GTLink
//
//  Created by Ria Patel on 11/15/22.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.2)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.black))
                    .multilineTextAlignment(.leading)
                    .animation(.linear, value: 1.0)
            }
            .cornerRadius(10)
            
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: .constant(0.2))
    }
}
