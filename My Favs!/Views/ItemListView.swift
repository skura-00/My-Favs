//
//  ItemListView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/08.
//

import SwiftUI

struct ItemListView: View {
    @Binding var favCategory: FavCategory
    @State private var selection: FavItem?
    
    @State private var isPresentingNewItemView = false
    @FocusState var focusedTask: FavItem?
    @State private var newItem = FavItem.emptyItem
    @State private var sortingOption = 1
    
    var body: some View {
        NavigationStack {
            
            HStack {
                Text("Sort by")
                    .foregroundColor(.black)
                Picker(selection: $sortingOption, label: Text("Sort")) {
                    Text("title").tag(1)
                    Text("rate").tag(2)
                    Text("date").tag(3)
                }
                .padding(.horizontal)
                .tint(Color.black)
                .pickerStyle(.menu)
                .border(Color.gray, width: 0.5)
            }
            .padding(2)
            
            List ($favCategory.favItems) { $item in
                    NavigationLink(destination: FavItemDetailView(favItem: $item)) {
                        
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
                    .foregroundColor(Color.black)
                    
            }
            .listStyle(.grouped)
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
        .foregroundColor(Color.orange)
        
    }
}

struct FavListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(favCategory: .constant())
    }
}
