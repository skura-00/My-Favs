//
//  FavListItem.swift
//  My Fevs!
//
//  Created by Sachi Kurata on 2023/06/07.
//

import SwiftUI

struct FavCategory: Identifiable, Hashable, Codable {
    var id: UUID
    var icon: String = FavCategoryIcons.iconName()
    var color: RGBAColor = FavCategoryColors.getColor().rgbaColor
    var label: String
    var favItems: [FavItem]
    
    init(id: UUID = UUID(), icon: String, color: RGBAColor, label: String, favItems: [FavItem]) {
        self.id = id
        self.icon = icon
        self.color = color
        self.label = label
        self.favItems = favItems
    }
    
    static var emptyCategory: FavCategory {
        FavCategory(icon: FavCategoryIcons.iconName(), color: FavCategoryColors.getColor().rgbaColor, label: String(), favItems: [])
    }
    
    mutating func remove(_ item: FavItem) {
        let id = item.id
        var index = 0
        
        for favItem in favItems {
            if id == favItem.id {
                favItems.remove(at: index)
            }
            index += 1
        }
    }
    
}


extension FavCategory {
    static let sampleData: [FavCategory] = [
        FavCategory(
            icon: "film.fill",
            color:  FavCategoryColors.getColor().rgbaColor,
            label: "Movie",
            favItems: [
                FavItem(title: "となりのトトロ", rate: 4, desc: "Movie")
            ]
        ),
        FavCategory(
            icon: "theatermasks.fill",
            color:  FavCategoryColors.getColor().rgbaColor,
            label: "TV Show",
            favItems: [
                FavItem(title: "Station 19", rate: 10, desc: "TV Show"),
                FavItem(title: "Young Sheldon", rate: 6, desc: "TV Show")
            ]
        )
    ]
    
}
