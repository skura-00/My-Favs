//
//  ContentView.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/07.
//

import SwiftUI
//import CoreData


struct FavCategoriesView: View {
    @Binding var favCategoryData: [FavCategory]
    /*#-code-walkthrough(5.eventData)*/
    @State private var isPresentingNewCategoryView = false
    @State var selection = false

    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            List ($favCategoryData) { $category in
                NavigationLink(destination: FavItemListView(favCategory: $category)) {
                    CategoryRow(favList: category)
                        
                }
            }
            .navigationTitle("Category")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isPresentingNewCategoryView = true
                    }) {
                        Image(systemName: "plus")
                    }
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
        FavCategoriesView(favCategoryData: .constant(FavCategory.sampleData), saveAction: {})
    }
}
