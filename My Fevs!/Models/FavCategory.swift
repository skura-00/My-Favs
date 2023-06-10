//
//  FavListItem.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/07.
//

import SwiftUI

struct FavCategory: Identifiable, Hashable, Codable {
    var id = UUID()
    var icon: String = FavCategoryIcons.iconName()
    var label: String = ""
    var favItems = [FavItem(title: "Sample Item", rate: 0, desc: "Other")]
    
    static var example = FavCategory(
        icon: "paintbrush.pointed.fill",
        label: "Anime",
        favItems: [
            FavItem(title: "鬼滅の刃", rate: 4.8, desc: "Anime"),
            FavItem(title: "ハイキュー", rate: 5.0, desc: "Anime"),
            FavItem(title: "ダイヤのA", rate: 4.9, desc: "Anime"),
            FavItem(title: "GATE", rate: 4.7, desc: "Anime")
        ]
    )
    
    static var delete = FavCategory(icon: "trash")
}
