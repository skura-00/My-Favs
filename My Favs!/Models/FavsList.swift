//
//  FavsList.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/09/01.
//

import Foundation


class FavsList: ObservableObject {
    @Published var categoryList: [FavCategory]
    
    init(categoryList: [FavCategory] = SQLiteDB.shared.getAllCategories()) {
        self.categoryList = categoryList
    }
    
    
    static let sampleData: [FavCategory] = [
        FavCategory(
            categoryId: 0,
            label: "Movies",
            favItems: [
                FavItem(itemId: 0, categoryId: 0, title: "NARUTO -ナルト-", rate: 8.5, desc: "Great TV Show!"),
                FavItem(itemId: 1, categoryId: 0, title: "A", rate: 0.1, desc: "Great TV Show!"),
                FavItem(itemId: 2, categoryId: 0, title: "B", rate: 8, desc: "Great TV Show!"),
                FavItem(itemId: 3, categoryId: 0, title: "C", rate: 4, desc: "Great TV Show!"),
                FavItem(itemId: 4, categoryId: 0, title: "D", rate: 3, desc: "Great TV Show!"),
                FavItem(itemId: 5, categoryId: 0, title: "E", rate: 2, desc: "Great TV Show!"),
                FavItem(itemId: 6, categoryId: 0, title: "F", rate: 3, desc: "Great TV Show!"),
                FavItem(itemId: 7, categoryId: 0, title: "G", rate: 5, desc: "Great TV Show!"),
                FavItem(itemId: 8, categoryId: 0, title: "H", rate: 5, desc: "Great TV Show!"),
                FavItem(itemId: 9, categoryId: 0, title: "I", rate: 8, desc: "Great TV Show!"),
                FavItem(itemId: 10, categoryId: 0, title: "J", rate: 7, desc: "Great TV Show!"),
                FavItem(itemId: 11, categoryId: 0, title: "K", rate: 10, desc: "Great TV Show!"),
                FavItem(itemId: 12, categoryId: 0, title: "魔法科高校の劣等生　Season 2 俺がうずまきナルトだってばよ！", rate: 8.5, desc: "Great TV Show!"),
            ]
        )
    ]
}

