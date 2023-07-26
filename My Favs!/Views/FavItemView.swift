//
//  ItemListView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/08.
//

import SwiftUI

struct FavItemView: View {
    @State var favCategory: FavCategory
    
    @State private var isPresentingNewItemView = false
    @FocusState var focusedTask: FavItem?
    @State private var newItem = FavItem.emptyItem
    @State private var option = 1
    @State private var sorting = 1
    
    let cols = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("", selection: $sorting) {
                    Text("Ascending").tag(1)
                    Text("Descending").tag(2)
                }
                .pickerStyle(.segmented)
                
                Picker("", selection: $option) {
                    Text("Date Added").tag(1)
                    Text("Rate").tag(2)
                    Text("Title").tag(3)
                }
                .pickerStyle(.segmented)
            }
            .padding(5)
            
            ItemListView()
                .navigationTitle("\(favCategory.label)")
            
        }
        .tint(.black)
    }
    
    
}

struct FavItemView_Previews: PreviewProvider {
    static var previews: some View {
        FavItemView(favCategory: FavCategory.sampleData[0])
    }
}
