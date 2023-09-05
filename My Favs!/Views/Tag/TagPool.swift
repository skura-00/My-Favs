//
//  TagPool.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/09/02.
//

import SwiftUI

struct TagPool: View {
    @EnvironmentObject var tags: TagsList
    
    let cols = [GridItem(.flexible()),
                GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: cols, spacing: 15) {
                ForEach(tags.tagList) { tag in
                    NormalTagRow()
                        .environmentObject(tag)
                }
            }
            .padding()
        }
        
    }
}

struct TagPool_Previews: PreviewProvider {
    static var previews: some View {
        TagPool()
            .environmentObject(TagsList().sampleTags())
    }
}
