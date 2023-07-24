//
//  MyFavsTabView.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/07/11.
//

import SwiftUI

// reference: https://www.youtube.com/watch?v=7vOF1kGnsmo
struct MyFavsTabView: View {
    @State var selectedTab = "Category"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CategoryListView(favCategoryData: FavCategory.sampleData, saveAction: {})
                .tag("Category")
                .tabItem {
                    Image(systemName: "tray.2")
                        .foregroundColor(Color.orange)
                }
            
            ItemSearchView()
                .tag("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.orange)
                }
            
            
        }
    }
}

struct MyFavsTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyFavsTabView()
    }
}
