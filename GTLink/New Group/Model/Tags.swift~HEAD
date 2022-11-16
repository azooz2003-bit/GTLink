//
//  Tag.swift
//  GTLink
//
//  Created by Nicholas Candello on 10/25/22.
//
import SwiftUI
import Foundation

enum Tags: String {
    
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
        var col: Color
        switch self {
        case .ios, .cs1999, .c_cplusplus:
            col = Color(red: 0, green: 163/255, blue: 255/255) // medium blue
        case .developer, .cs1301:
            col = Color(red: 5/255, green: 0, blue: 252/255)   // dark blue
        case .beginner:
            col = Color(red: 255/255, green: 153/255, blue: 0) // orange
        case .designer:
            col = Color(red: 0, green: 255/255, blue: 240/255) // neon blue
        case .class_project:
            col = Color(red: 112/255, green: 255/255, blue: 0) // neon green
        case .homework:
            col = Color(red: 200/255, green: 83/255, blue: 255/255)// purple
        }
        return col
        
    }
    
}
