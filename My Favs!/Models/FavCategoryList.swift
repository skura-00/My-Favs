//
//  FavCategoryList.swift
//  My Favs!
//
//  Created by SK on 2023/08/31.
//

import Foundation

class FavCategoryList: ObservableObject {
    var categoryList: [FavCategory]
    
    init(categories: [FavCategory] = SQLiteDB.shared.getAllCategories()) {
        self.categoryList = categories
    }
}
