//
//  FavItem.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/07.
//

import Foundation

class FavItem: ObservableObject, Identifiable {
    @Published var itemId: Int64
    @Published var categoryId: Int64
    @Published var title: String
    @Published var rate: Double
    @Published var desc: String
    @Published var tags: TagsList
    @Published var date: Date
    
    init(itemId: Int64, categoryId: Int64, title: String, rate: Double,
         desc: String, tags: TagsList = TagsList(), date: Date = Date()) {
        self.itemId = itemId
        self.categoryId = categoryId
        self.title = title
        self.rate = rate
        self.desc = desc
        self.tags = tags
        self.date = date
    }
    
    static var emptyItem: FavItem {
        FavItem(itemId: 0, categoryId: 0, title: String(), rate: 0, desc: String())
    }
}
