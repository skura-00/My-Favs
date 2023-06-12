//
//  FavListItem.swift
//  My Fevs!
//
//  Created by Sachi Kurata on 2023/06/07.
//

import SwiftUI

struct FavCategory: Identifiable, Hashable, Codable {
    var id: UUID
    var icon: String
    var label: String
    var favItems: [FavItem]
    
    init(id: UUID = UUID(), icon: String , label: String, favItems: [FavItem]) {
        self.id = id
        self.icon = FavCategoryIcons.iconName()
        self.label = label
        self.favItems = favItems
    }
    
    static var emptyCategory: FavCategory {
        FavCategory(icon: FavCategoryIcons.iconName(), label: String(), favItems: [])
    }
    
    mutating func remove(_ item: FavItem) {
        var id = item.id
        var index = 0
        
        for favItem in favItems {
            if id == favItem.id {
                favItems.remove(at: index)
            }
            index += 1
        }
    }
    
    static var delete = FavCategory(icon: "trash", label: "", favItems: [])
}


extension FavCategory {
    static let sampleData: [FavCategory] = [
        FavCategory(
            icon: "film.fill",
            label: "Movie",
            favItems: [
                FavItem(title: "となりのトトロ", rate: 4, desc: "Movie")
            ]
        ),
        FavCategory(
            icon: "theatermasks.fill",
            label: "TV Show",
            favItems: [
                FavItem(title: "Station 19", rate: 10, desc: "TV Show"),
                FavItem(title: "Young Sheldon", rate: 6, desc: "TV Show")
            ]
        )
    ]
    
}
