//
//  SortOption.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/08/27.
//

import Foundation

enum SortOption: CaseIterable, Identifiable {
    case DATE, RATE, TITLE
    
    var id: Self { self }
    
    func description() -> String {
        switch self {
        case .DATE:
            return "Date Added"
        case .RATE:
            return "Rate"
        case .TITLE:
            return "Title"
        }
    }
}
