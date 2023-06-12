//
//  FavItemRow.swift
//  My Fevs!
//
//  Created by Sachi Kurata on 2023/06/08.
//

import SwiftUI

struct CategoryRow: View {
    let category: FavCategory
    
    var body: some View {
        HStack {
            Label {
                VStack {
                    Text(category.label)
                        .fontWeight(.bold)
                }
            } icon: {
                Image(systemName: category.icon)
                    .foregroundColor(Color(category.color))
                    .padding(.trailing, 10)
            }
            .padding(10)
        }
        .badge(category.favItems.count)
        
        
    }
    
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(category: FavCategory.sampleData[0])
    }
}
