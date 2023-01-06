//
//  DataConversion.swift
//  GTLink
//
//  Created by Abdulaziz Albahar on 1/5/23.
//

import Foundation

class DataConversion {
    
    static func tagsToString(tags: Dictionary<Tags, Bool>) -> Dictionary<String, Bool> {
        let mapped = Dictionary<String, Bool>(uniqueKeysWithValues: tags.map ({ key, val in
            print(key)
            print(Tags.self)
            return (
                key.rawValue, val
            )
        }))
        
        return mapped
    }
    
    static func stringToTags(tags: Dictionary<String, Bool>) -> Dictionary<Tags, Bool> {
        let mapped = Dictionary<Tags, Bool>(uniqueKeysWithValues: tags.map ({ key, val in
            print(key)
            print(Tags.self)
            return (
                Tags.allCases.first(where: {
                    $0.rawValue.elementsEqual(key.description)
                })!, val
            )
        }))
        
        return mapped
    }
    
    static func interestsToStrings(interests: Dictionary<Interests, Bool>) -> Dictionary<String, Bool> {
        let mapped = Dictionary<String, Bool>(uniqueKeysWithValues: interests.map ({ key, val in
            print(key)
            print(Interests.self)
            return (
                key.rawValue, val
            )
        }))
        
        return mapped
    }
    
    
    static func stringToInterests(interests: Dictionary<String, Bool>) -> Dictionary<Interests, Bool> {
        let mapped = Dictionary<Interests, Bool>(uniqueKeysWithValues: interests.map ({ key, val in
            print(key)
            print(Interests.self)
            return (
                Interests.allCases.first(where: {
                    $0.rawValue.elementsEqual(key.description)
                })!, val
            )
        }))
        
        return mapped
    }
}
