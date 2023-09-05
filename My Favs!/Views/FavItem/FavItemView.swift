//
//  ItemListView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/08.
//
// https://sarunw.com/posts/swiftui-picker-enum/

import SwiftUI

struct FavItemView: View {
    @EnvironmentObject var toRoot: ToRoot
    @EnvironmentObject var favCategory: FavCategory
    @Environment(\.presentationMode) private var presentationMode

    @State var sorting: Int = 1
    @State var sortOp: SortOption = .DATE
    @State var isPresentingNewItemView = false
    @State var selection: FavItem?
    
    let cols = [GridItem(.flexible())]
    
    
    var sortedItems: [FavItem] {
        let items = favCategory.favItems
        
        if (sorting == 1) {
            switch sortOp {
            case .DATE:
                return items.sorted { $0.date < $1.date }
            case .RATE:
                return items.sorted { $0.rate < $1.rate }
            case .TITLE:
                return items.sorted { $0.title < $1.title }
            }
        } else {
            switch sortOp {
            case .DATE:
                return items.sorted { $0.date > $1.date }
            case .RATE:
                return items.sorted { $0.rate > $1.rate }
            case .TITLE:
                return items.sorted { $0.title > $1.title }
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(sortedItems) { item in
                    FavItemRow(item: item)
                        .overlay(
                            NavigationLink("", destination: FavItemDetailView().environmentObject(item))
                                .opacity(0)
                        )
                        .padding(.vertical, 20)
                        .swipeActions(edge: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/, allowsFullSwipe: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
                            Button(role: .destructive) {
                                selection = nil
                                if (SQLiteDB.shared.deleteFavItem(categoryId: favCategory.categoryId, itemId: item.itemId)) {
                                    favCategory.favItems = SQLiteDB.shared.getAllItems(id: favCategory.categoryId)
                                }
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker("", selection: $sorting) {
                        Text("Ascending").tag(1)
                        Text("Descending").tag(2)
                    }
                    .pickerStyle(.automatic)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker("", selection: $sortOp) {
                        ForEach(SortOption.allCases) { option in
                            Text("\(option.description())")
                        }
                    }
                    .pickerStyle(.automatic)
                }
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button (action: {
                        isPresentingNewItemView = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.orange)
                    }
                    .accessibilityLabel("New Item")
                }
            }
            .sheet(isPresented: $isPresentingNewItemView) {
                NewFavItemSheet(isPresentingNewItemView: $isPresentingNewItemView)
                    .environmentObject(favCategory)
            }
            .navigationTitle("\(favCategory.label)")
        }
        .navigationBarBackButtonHidden(true)
        .tint(.black)
        .onChange(of: toRoot.toRoot) { _ in
                    presentationMode.wrappedValue.dismiss()
           }
    }
    
}

struct FavItemView_Previews: PreviewProvider {
    static var previews: some View {
        FavItemView()
            .environmentObject(ToRoot())
            .environmentObject(FavCategory.sampleData[0])
    }
}
