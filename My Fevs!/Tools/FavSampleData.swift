//
//  FavSampleData.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/07.
//

import SwiftUI

class FavSampleData: ObservableObject {
    @Published var sampleData: [FavCategory] = [
        FavCategory(
            icon: "film.fill",
            label: "Movie",
            favItems: [
                FavItem(title: "となりのトトロ", rate: 4.7, category: "Movie"),
                FavItem(title: "クレヨンしんちゃん", rate: 5.0, category: "Movie"),
                FavItem(title: "The mother", rate: 4.9, category: "Movie"),
                FavItem(title: "Spider-Man", rate: 4.7, category: "Movie")
            ]
        ),
        FavCategory(
            icon: "theatermasks.fill",
            label: "TV Show",
            favItems: [
                FavItem(title: "Station 19", rate: 4.8, category: "TV Show"),
                FavItem(title: "Young Sheldon", rate: 5.0, category: "TV Show"),
                FavItem(title: "Mr. Sunshine", rate: 4.9, category: "TV Show"),
                FavItem(title: "Glee", rate: 4.7, category: "TV Show")
            ]
        ),
        FavCategory(
            icon: "paintbrush.pointed.fill",
            label: "Anime",
            favItems: [
                FavItem(title: "鬼滅の刃", rate: 4.8, category: "Anime"),
                FavItem(title: "ハイキュー", rate: 5.0, category: "Anime"),
                FavItem(title: "ダイヤのA", rate: 4.9, category: "Anime"),
                FavItem(title: "GATE", rate: 4.7, category: "Anime")
            ]
        )
    
    ]
    
    func add(_ item: FavCategory) {
        sampleData.append(item)
    }
        
    func remove(_ item: FavCategory) {
        sampleData.removeAll { $0.id == item.id}
    }
    
    func getBindingToData(_ item: FavCategory) -> Binding<FavCategory>? {
        Binding<FavCategory>(
            get: {
                guard let index = self.sampleData.firstIndex(where: { $0.id == item.id }) else { return FavCategory.delete }
                return self.sampleData[index]
            },
            set: { item in
                guard let index = self.sampleData.firstIndex(where: { $0.id == item.id }) else { return }
                self.sampleData[index] = item
            }
        )
    }
}
