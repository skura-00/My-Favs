//
//  CategoryListView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/07.
//

import SwiftUI
//import CoreData

struct CategoryListView: View {
//    @Binding var favCategoryData: [FavCategory]
    @State var favCategoryData: [FavCategory]
    /*#-code-walkthrough(5.eventData)*/
    @State private var isPresentingNewCategoryView = false
    @State private var selection: FavCategory?
    @State private var sortingOption = 1
    
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    let cols = [GridItem(.flexible()),
                GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: cols) {
                    ForEach($favCategoryData, id: \.self) { $category in
                        NavigationLink(destination: FavItemView(favCategory: category)) {
                            
                            CategoryRow(category: category)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .foregroundColor(Color.black)
            .navigationTitle(Text("Category"))
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isPresentingNewCategoryView = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(Color.orange)
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
        .foregroundColor(Color.orange)
        .tint(.black)
        .navigationBarBackButtonHidden(true)
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(favCategoryData: FavCategory.sampleData, saveAction: {})
    }
}
