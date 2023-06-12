//
//  CategoryListView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/07.
//

import SwiftUI
//import CoreData


struct CategoryListView: View {
    @Binding var favCategoryData: [FavCategory]
    /*#-code-walkthrough(5.eventData)*/
    @State private var isPresentingNewCategoryView = false
    @State private var selection: FavCategory?
    
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            List ($favCategoryData) { $category in
                NavigationLink(destination: ItemListView(favCategory: $category)) {
                    CategoryRow(category: category)
                        .swipeActions {
                            Button(action: {
                                selection = nil
                                category.removeAll()
                                favCategoryData.remove(at: favCategoryData.firstIndex(of: category) ?? 0)
                                // Is this okay??
                            }) {
                                Image(systemName: "trash")
                            }
                        }
                }
            }
            .navigationTitle(Text("Category"))
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isPresentingNewCategoryView = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel(Text("New Item"))
                }
            }
            .sheet(isPresented: $isPresentingNewCategoryView) {
                NewCategorySheet(favData: $favCategoryData, isPresentingNewCategoryView: $isPresentingNewCategoryView)
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(favCategoryData: .constant(FavCategory.sampleData), saveAction: {})
    }
}
