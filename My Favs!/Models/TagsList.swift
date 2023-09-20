////
////  TagsList.swift
////  My Favs!
////
////  Created by SK on 2023/09/01.
////
//
//import Foundation
//
//class TagsList: ObservableObject {
//    @Published var tagList: [Tag]
//    
//    init(tagList: [Tag] = []) {
//        self.tagList = tagList
//    }
//    
//    func add(tag: Tag) {
//        self.tagList.append(tag)
//    }
//    
//    func remove(tag: Tag) {
//        var index = 0
//        for t in tagList {
//            if (t.tagId == tag.tagId) {
//                tagList.remove(at: index)
//            }
//            index += 1
//        }
//    }
//    
//    func sampleTags() -> TagsList {
//        let tags = TagsList()
//        tags.add(tag: Tag(tagId: 0, name: "アニメ"))
//        tags.add(tag: Tag(tagId: 1, name: "韓国ドラマ"))
//        tags.add(tag: Tag(tagId: 2, name: "アルバス・ウルフリック・パーシバル"))
//        tags.add(tag: Tag(tagId: 3, name: "キム・テリ"))
//        tags.add(tag: Tag(tagId: 4, name: "タグ"))
//        tags.add(tag: Tag(tagId: 5, name: "tag1"))
//        tags.add(tag: Tag(tagId: 6, name: "タグ２"))
//        return tags
//    }
//}
//
