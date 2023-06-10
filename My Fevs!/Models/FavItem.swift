//
//  FavItem.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/07.
//

import SwiftUI

struct FavItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String = "Sample Item"
    var rate: Double = 0
    var desc: String = "This movie is great!"
    
    static var example = FavItem(title: "鬼滅の刃", rate: 4.8, desc: "I love this Anime!")
    
    static var delete = FavItem()
}
