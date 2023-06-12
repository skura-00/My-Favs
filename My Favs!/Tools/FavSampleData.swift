//
//  FavSampleData.swift
//  My Fevs!
//
//  Created by Sachi Kurata on 2023/06/07.
//

import SwiftUI

class FavSampleData: ObservableObject {
    @Published var sampleData: [FavCategory] = [
        FavCategory(
            icon: "film.fill",
            label: "Movie",
            favItems: [
                FavItem(title: "となりのトトロ", rate: 4, desc: "Movie"),
                FavItem(title: "クレヨンしんちゃん", rate: 5, desc: "Movie"),
                FavItem(title: "The mother", rate: 4, desc: "Movie"),
                FavItem(title: "Spider-Man", rate: 4, desc: "Movie")
            ]
        ),
        FavCategory(
            icon: "theatermasks.fill",
            label: "TV Show",
            favItems: [
                FavItem(title: "Station 19", rate: 10, desc: "TV Show"),
                FavItem(title: "Young Sheldon", rate: 6, desc: "TV Show"),
                FavItem(title: "Mr. Sunshine", rate:7, desc: "TV Show"),
                FavItem(title: "Glee", rate: 4, desc: "TV Show")
            ]
        ),
        FavCategory(
            icon: "paintbrush.pointed.fill",
            label: "Anime",
            favItems: [
                FavItem(title: "鬼滅の刃", rate: 4, desc: "Anime"),
                FavItem(title: "ハイキュー", rate: 5, desc: "Anime"),
                FavItem(title: "ダイヤのA", rate: 4, desc: "Anime"),
                FavItem(title: "GATE", rate: 4, desc: "Anime"),
                FavItem(title: "とある科学の超電磁砲", rate: 4, desc: "Anime"),
                FavItem(title: "黒子のバスケ", rate: 5, desc: "Anime"),
                FavItem(title: "おおきく振りかぶって", rate: 4, desc: "Anime"),
                FavItem(title: "ONE PIECE", rate: 4, desc: "Anime"),
                FavItem(title: "ハンターxハンター", rate: 4, desc: "Anime"),
                FavItem(title: "サザエさん", rate: 5, desc: "Anime"),
                FavItem(title: "名探偵コナン", rate: 4, desc: "Anime"),
                FavItem(title: "ちびまる子ちゃん", rate: 4, desc: "Anime"),
                FavItem(title: "東京リベンジャーズ", rate: 4, desc: "Anime"),
                FavItem(title: "呪術廻戦", rate: 10, desc: "Anime"),
                FavItem(title: "七つの大罪", rate: 7, desc: "Anime"),
                FavItem(title: "ソードアートオンライン", rate: 4, desc: "Anime")
            ]
        )
    
    ]
    
    func add(_ item: FavCategory) {
        sampleData.append(item)
    }
    
    func addItem(_ item: FavItem, category: inout FavCategory) {
        for cate in sampleData {
            if cate.id == category.id {
                category.favItems.append(item)
            }
        }
    }
        
    func remove(_ item: FavCategory) {
        sampleData.removeAll { $0.id == item.id}
    }
    
    
    func removeItem(_ item: FavItem, category: inout FavCategory) {
        for cate in sampleData {
            if cate.id == category.id {
                category.favItems.removeAll {$0.id == item.id}
            }
        }
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
