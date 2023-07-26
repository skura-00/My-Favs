//
//  FavCategory.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/07.
//

import SwiftUI

struct FavCategory: Identifiable, Hashable, Codable {
    var id: UUID
    var icon: String = FavCategoryIcons.iconName()
//    var color: Color //RGBAColor = FavCategoryColors.getColor().rgbaColor
    var label: String
    var favItems: [FavItem]
    
    init(id: UUID = UUID(), icon: String/*, color: RGBAColor*/, label: String, favItems: [FavItem]) {
        self.id = id
        self.icon = icon
//        self.color = color
        self.label = label
        self.favItems = favItems
    }
    
    static var emptyCategory: FavCategory {
        FavCategory(icon: FavCategoryIcons.iconName()/*, color: FavCategoryColors.getColor().rgbaColor*/, label: String(), favItems: [])
    }
    
    mutating func removeAll() {
        favItems.removeAll()
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
//            color:  FavCategoryColors.getColor()/*.rgbaColor*/,
            label: "Movies",
            favItems: [
                FavItem(title: "NARUTO -ナルト-", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "魔法科高校の劣等生　Season 2 俺がうずまきナルトだってばよ！", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
            ]
        ),
        FavCategory(
            icon: "star.fill",
//            color:  FavCategoryColors.getColor()/*.rgbaColor*/,
            label: "Favorite",
            favItems: [
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
                FavItem(title: "Station 18", rate: 8.5, desc: "Great TV Show!"),
            ]
        )
    ]
    
}
