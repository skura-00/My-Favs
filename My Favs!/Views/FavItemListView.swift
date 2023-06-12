//
//  FavListView.swift
//  My Fevs!
//
//  Created by Sachi Kurata on 2023/06/08.
//

import SwiftUI

struct FavItemListView: View {
    @Binding var favCategory: FavCategory
    @State private var selection: FavItem?
    
    @State private var isPresentingNewItemView = false
    @FocusState var focusedTask: FavItem?
    @State private var newItem = FavItem.emptyItem
    
    var body: some View {
        NavigationStack {
            List ($favCategory.favItems) { $item in
                    NavigationLink(destination: FavDetailView(favItem: $item)) {
                        
                        VStack (alignment: .leading) {
                            Text("\(item.title)")
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                                .padding(.bottom, 0.2)
                            
                            Text("\(String(format: "%0.1f", item.rate))")
                        }
                        .swipeActions {
                            Button(action: {
                                selection = nil
                                favCategory.remove(item)
                            }) {
                                Image(systemName: "trash")
                            }
                        }
                    }
                    
            }
            .navigationTitle(Text("\(favCategory.label)"))
            .toolbar {
                ToolbarItem {
                    Button (action: {
                        isPresentingNewItemView = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("New Item")
                }
            }
            .sheet(isPresented: $isPresentingNewItemView) {
                NewFavItemSheet(category: $favCategory, isPresentingNewItemView: $isPresentingNewItemView)
            }
        }
            
        
    }
}

struct FavListView_Previews: PreviewProvider {
    static var previews: some View {
        FavItemListView(favCategory: .constant(FavCategory.sampleData[0]))
    }
}
