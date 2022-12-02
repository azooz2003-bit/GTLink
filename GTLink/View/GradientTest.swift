//
//  GradientTest.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 11/28/22.
//

import SwiftUI

struct GradientTest: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 300, height: 200)
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.orange, .white]), center: UnitPoint(x: 0.3, y: 0.3) , startRadius: 5, endRadius: 100))
                    .frame(width: 300, height: 200)
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.yellow, .white]), center: UnitPoint(x: 0.75, y: 0.75), startRadius: 5, endRadius: 150))
                    .frame(width: 300, height: 200)
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.purple, .white]), center: UnitPoint(x: 0.0, y: 0.75), startRadius: 5, endRadius: 100))
                    .frame(width: 300, height: 200)
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.green, .white]), center: UnitPoint(x: 0.75, y: 0.0), startRadius: 5, endRadius: 50))
                    .frame(width: 300, height: 200)
            }
            .blur(radius: 20)
            .blendMode(.multiply)
            .clipped()
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.5), radius: 5, y: 2)

           
        }
    }
}

struct GradientTest_Previews: PreviewProvider {
    static var previews: some View {
        GradientTest()
    }
}
