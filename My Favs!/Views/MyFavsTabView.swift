//
//  MyFavsTabView.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/07/11.
//

import SwiftUI

// reference: https://www.youtube.com/watch?v=7vOF1kGnsmo
// https://www.waldo.com/blog/how-to-use-swift-tabview-with-examples?utm_source=google&utm_medium=paidsearch&utm_campaign=Waldo_Search_DSA_High_AMS_EN&utm_term=&gclid=Cj0KCQjw5f2lBhCkARIsAHeTvlgKdus1PXZn8T9srLVZx22ew9-vKu-qNNqDpb4-pRKCDUulGReBj6AaAp9gEALw_wcB




struct MyFavsTabView: View {
    @State private var selectedTab: Tab = .tray
    
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    CategoryListView(favCategoryData: FavCategory.sampleData, saveAction: {})
                        .tag(Tab.tray)

                    ItemSearchView()
                        .tag(Tab.magnifyingglass)
                }
            }
            VStack {
                Spacer()
                TabBar(selected: $selectedTab)
            }
        }
        
    }
}

struct MyFavsTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyFavsTabView()
    }
}
