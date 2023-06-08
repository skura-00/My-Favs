//
//  FavListItem.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/07.
//

import SwiftUI

struct FavListItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var icon: String = FavListIcons.iconName()
    var label: String = ""
    var favItems = [FavItem(title: "", rate: 0, category: "")]
    
    static var example = FavListItem(
        icon: "film.fill",
        label: "Movies",
        favItems: [
            FavItem(title: "となりのトトロ", rate: 4.7, category: "Movie"),
            FavItem(title: "クレヨンしんちゃん", rate: 5.0, category: "Movie"),
            FavItem(title: "The mother", rate: 4.9, category: "Movie"),
            FavItem(title: "Spider-Man", rate: 4.7, category: "Movie")
        ]
    )
    
    static var delete = FavListItem(icon: "trash")
}
