//
//  ContentView.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/07.
//

import SwiftUI
import CoreData


struct FavListView: View {
    @ObservedObject var favItemData: FavSampleData
    @State private var selection: FavCategory?
    /*#-code-walkthrough(5.eventData)*/
    @State private var isAddingCategory = false
    @State private var newCategory = FavCategory()

    var body: some View {
        
        NavigationSplitView {
            List (selection: $selection) {
                ForEach (favItemData.sampleData) { item in
                    FavCategoryRow(favList: item)
                        .tag(item)
                    /*#-code-walkthrough(5.deleteEvents)*/
                        .swipeActions {
                            Button(role: .destructive) {
                                selection = nil
                                favItemData.remove(item)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
                
            }
            .navigationTitle("Category")
            .toolbar {
                ToolbarItem {
                    Button {
                        newCategory = FavCategory()
                        isAddingCategory = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingCategory) {
                NavigationStack {
                    FavCategoryModifier(favListItem: $newCategory, isNew: true)
                        .toolbar {
                           ToolbarItem(placement: .cancellationAction) {
                               Button("Cancel") {
                                   isAddingCategory = false
                               }
                           }
                           ToolbarItem {
                               Button {
                                   favItemData.add(newCategory)
                                   isAddingCategory = false
                               } label: {
                                   Text("Add")
                               }
                               .disabled(newCategory.label.isEmpty)
                           }
                        }
                }
            }
        } detail: {
            ZStack {
                if let item = selection, let itemBinding = favItemData.getBindingToData(item) {
                    FavCategoryModifier(favListItem: itemBinding)
                } else {
                    Text("Select an Event")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FavListView(favItemData: FavSampleData()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
