//
//  CreateProfile2-4.swift
//  GTLink
//
//  Created by Ria Patel on 11/8/22.
//

import SwiftUI

struct CreateProfile2_4: View {
    
    @State var val1 = ""
    @State var val2 = ""
    @State var val3 = ""
    var placeholder1 = "Year"
    var placeholder2 = "Major"
    var placeholder3 = "Minor"
    var dropdownYear = ["2022","2023","2024","2025","2026","2027"]
    var dropdownMajor  = ["Computer Science", "Computer Engineering", "Industrial Design", "Computational Media", "Mechanical Engineering", "Civil Engineering", "Electrical Engineering"]
    var dropdownMinor = ["Industrial Design", "Computing and Media", "Computing and Intelligence", "Computing and People", "Computing and Business","Architecture", "Aerospace Engineering", "Robotics"]
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Step 2/4")
                    .font(.system(size: 20))
                    .padding(.leading, 30)
                Spacer()
            }
            HStack {
                Text("A little more about you.")
                    .font(.system(size: 26))
                    .fontWeight(.medium)
                    .padding(.leading, 30)
                Spacer()
            }
            Image("undraw_education_f8ru_1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 90)
                .padding(.top, 50)
            Menu {
                ForEach(dropdownYear, id: \.self) { year in
                    Button(year) {
                        self.val1 = year
                    }
                }
            } label: {
                HStack{
                    Spacer()
                    Text(val1.isEmpty ? placeholder1 : val1)
                        .foregroundColor(val1.isEmpty ? Color.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255) : .black)
                        .padding(.vertical,13)
                    Spacer()
                    Image("Chevron")
                        .padding(.trailing, 13)
                        
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(Color.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255), lineWidth: 1)

                )
                
                
            }.padding(.horizontal, 30)
                .padding(.top, 30)
            Menu {
                ForEach(dropdownMajor, id: \.self) { major in
                    Button(major) {
                        self.val2 = major
                    }
                }
            } label: {
                HStack{
                    Spacer()
                    Text(val2.isEmpty ? placeholder2 : val2)
                        .foregroundColor(val2.isEmpty ? Color.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255) : .black)
                        .padding(.vertical,13)
                    Spacer()
                    Image("Chevron")
                        .padding(.trailing, 13)
                        
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(Color.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255), lineWidth: 1)

                )
                
                
            }.padding(.horizontal, 30)
                .padding(.top, 25)
            
            Menu {
                ForEach(dropdownMinor, id: \.self) { minor in
                    Button(minor) {
                        self.val3 = minor
                    }
                }
            } label: {
                HStack{
                    Spacer()
                    Text(val3.isEmpty ? placeholder3 : val3)
                        .foregroundColor(val3.isEmpty ? Color.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255) : .black)
                        .padding(.vertical,13)
                    Spacer()
                    Image("Chevron")
                        .padding(.trailing, 13)
                        
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(Color.init(red: 121 / 255, green: 121 / 255, blue: 121 / 255), lineWidth: 1)

                )
                
                
            }.padding(.horizontal, 30).padding(.top, 25)
            
            Spacer()
            Button(action: {}){
                Text("Next")
                    .font(.system(size: 24))
                    .foregroundColor(.white).padding(.horizontal, 133)
                    .padding(.vertical, 10)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.init(red: 62 / 255, green: 127 / 255, blue: 204 / 255), Color.init(red: 38 / 255, green: 87 / 255, blue: 145 / 255)]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
                    
            }
            
            
        }
    }
}

struct CreateProfile2_4_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfile2_4()
    }
}
