//
//  MultipleSelectionRow.swift
//  GTLink
//
//  Created by Ria Patel on 11/10/22.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var color: [Color]
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        if self.isSelected {
            Button(action: self.action) {
                Text(self.title)
                    .foregroundColor(.white)
                    .font(.system(size:18))
                    .padding(.horizontal,17)
                    .padding(.vertical, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(.clear)
                    )

            }
            
//             LinearGradient(gradient: Gradient(colors: [Color.init(red: 62 / 255, green: 127 / 255, blue: 204 / 255), Color.init(red: 38 / 255, green: 87 / 255, blue: 145 / 255)]), startPoint: .leading, endPoint: .trailing)
            .background(
                LinearGradient(gradient: Gradient(colors: [self.color[0], self.color[1]]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(15)
            
        } else {
            Button(action: self.action) {
                Text(self.title)
                    .foregroundColor(.black)
                    .font(.system(size:18))
                    .padding(.horizontal, 17)
                    .padding(.vertical, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .stroke(self.color[0], lineWidth:1)
                    )
            }
            .background(.white)
            .cornerRadius(15)
            
        }
            
        
    }
}

struct MultipleSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionRow(title: "Hi", color: [Color.purple, Color.blue], isSelected: true, action: {})
    }
}
