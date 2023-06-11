//
//  FavItem.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/07.
//

import SwiftUI

struct FavItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String = String()
    var rate: Double = 0
    var desc: String = String()
    
    static var example = FavItem(title: "鬼滅の刃", rate: 4.4, desc: "I love this Anime!")
    
    static var delete = FavItem()
}
