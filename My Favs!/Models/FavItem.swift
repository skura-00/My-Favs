//
//  FavItem.swift
//  My Fevs!
//
//  Created by Sachi Kurata on 2023/06/07.
//

import SwiftUI

struct FavItem: Identifiable, Hashable, Codable {
    var id: UUID
    var title: String
    var rate: Double
    var desc: String
    
    init(id: UUID = UUID(), title: String, rate: Double, desc: String) {
        self.id = id
        self.title = title
        self.rate = rate
        self.desc = desc
    }

    static var emptyItem: FavItem {
        FavItem(title: String(), rate: 0.0, desc: "")
    }
    
}

extension FavItem {
    static let sampleData: [FavItem] = [
    ]
}
