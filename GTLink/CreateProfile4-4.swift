//
//  CreateProfile4-4.swift
//  GTLink
//
//  Created by Ria Patel on 11/10/22.
//

import SwiftUI

struct CreateProfile4_4: View {
    @State var progressValue: Float = 0.2
    @State var count: Int = 0
    @State var items: [String] = ["Python", "Java", "C++", "CAD", "Hardware", "App Dev", "UI/UX","Web Dev", "Game Dev"]
//    @State var colors: [Color] = [
//        [.init(red: 255 / 255, green: 217 / 255, blue: 107 / 255), .init(red: 241 / 255, green: 184 / 255, blue: 20 / 255)],
//        [.init(red: 255 / 255, green: 217 / 255, blue: 107 / 255), .init(red: 241 / 255, green: 184 / 255, blue: 20 / 255)],
//        [.init(red: 255 / 255, green: 217 / 255, blue: 107 / 255), .init(red: 241 / 255, green: 184 / 255, blue: 20 / 255)],
//        [.init(red: 255 / 255, green: 217 / 255, blue: 107 / 255), .init(red: 241 / 255, green: 184 / 255, blue: 20 / 255)],
//        [.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255), .black],
//        [.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255), .black],
//        [.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255), .black],
//        [.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255), .black],
//        [.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255), .black]]
    @State var selections: [String] = []

//    LinearGradient(gradient: Gradient(colors: [Color.init(red: 62 / 255, green: 127 / 255, blue: 204 / 255), Color.init(red: 38 / 255, green: 87 / 255, blue: 145 / 255)]), startPoint: .leading, endPoint: .trailing)
    
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
                .padding(.bottom, 50)
            
            
            let rows: [GridItem] =
            Array(repeating: .init(.adaptive(minimum: 70), spacing: 35), count:3)
//            var count = 0
            
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(self.items, id: \.self) { item in
                    MultipleSelectionRow(title: item, color: [.green,.yellow], isSelected: self.selections.contains(item)) {
                        if self.selections.contains(item) {
                            self.selections.removeAll(where: { $0 == item })
                            count = self.selections.count
                            progressValue = Float(count) * 0.2
                        }
                        else {
                            self.selections.append(item)
                            count = self.selections.count
                            progressValue = Float(count) * 0.2
                        }
                    }
//                    count += 1
                }
            }
            .padding(.horizontal, 10)
            
            ProgressBar(value: $progressValue).frame(height:7)
                .padding(.vertical, 25)
                .padding(.horizontal, 60)
            
            Text("selected \(count) out of 5")
                .font(.system(size: 16))
                .multilineTextAlignment(.trailing)
                .padding(.trailing,30)
            
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
