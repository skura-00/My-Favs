//
//  FavCategoryIcons.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/08.
//

struct FavCategoryIcons {
    
    static func iconName() -> String {
        if let name = iconNames.randomElement() {
            return name
        } else {
            return ""
        }
    }
    
    static func iconNames(_ number: Int) -> [String] {
        var names: [String] = []
        for _ in 0..<number {
            names.append(iconName())
        }
        return names
    }
        
    static var iconNames: [String] = [
        "tv.fill",
        "popcorn.fill",
        "mic.fill",
        "play.rectangle.fill",
        "star.bubble.fill",
        "video.fill",
        "theatermasks.fill",
        "film.fill",
    ]
}
