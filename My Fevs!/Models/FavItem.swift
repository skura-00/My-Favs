//
//  FavItem.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/07.
//

import SwiftUI

struct FavItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String
    var rate: Double
    var category: String
}
