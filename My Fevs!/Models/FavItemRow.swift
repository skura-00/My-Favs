//
//  FavItemRow.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/08.
//

import SwiftUI

struct FavItemRow: View {
    let favList: FavListItem
    
    var body: some View {
        HStack {
            Label {
                VStack {
                    Text(favList.label)
                        .fontWeight(.bold)
                }
            } icon: {
                Image(systemName: favList.icon)
                    .padding(.trailing, 10)
            }
            
        }.badge(favList.favItems.count)
        
        
    }
    
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        FavItemRow(favList: FavListItem.example)
    }
}
