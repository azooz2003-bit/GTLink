//
//  Tag.swift
//  GTLink
//
//  Created by Nicholas Candello on 10/25/22.
//
import SwiftUI

import Foundation

enum Tag: String {
    
    case ios = "iOS"
    case developer = "Developer"
    case beginner = "Beginner"
    case cs1999 = "CS 1999"
    case class_project = "Class Project"
    case designer = "Designer"
    case cs1301 = "CS 1301"
    case homework = "Homework"
    case c_cplusplus = "C/C++"
    
    //color assigned with each Tag type
    var color: Color {
        
        switch self {
        case .ios, .cs1999, .c_cplusplus:
            return Color(red: 0, green: 163, blue: 255) // medium blue
        case .developer, .cs1301:
            return Color(red: 5, green: 0, blue: 252)   // dark blue
        case .beginner:
            return Color(red: 255, green: 153, blue: 0) // orange
        case .designer:
            return Color(red: 0, green: 255, blue: 240) // neon blue
        case .class_project:
            return Color(red: 112, green: 255, blue: 0) // neon green
        case .homework:
            return Color(red: 200, green: 83, blue: 255)// purple
        default:
            return Color(red: 0, green: 163, blue: 255) // medium blue (default)
        }
        
    }
        
}
