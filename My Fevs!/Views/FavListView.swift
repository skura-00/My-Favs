//
//  FavListView.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/08.
//

import SwiftUI

struct FavListView: View {
    @ObservedObject var favItemData: FavSampleData
    @Binding var favCategory: FavCategory
    @State var isNew = false
    @State private var isShowingDetail = false
    @State private var isAddingFavItem = false
    @State private var selection: FavItem?
    @State private var newItem = FavItem()
    
    @Environment(\.presentationMode) var presentationMode
//    @Environment(\.dismiss) private var dismiss
    @FocusState var focusedTask: FavItem?
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($favCategory.favItems) { $item in
                    NavigationLink(destination: FavDetailView(favItem: $item)) {
                        
                        VStack (alignment: .leading) {
                            Text("\(item.title)")
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                                .padding(.bottom, 0.2)
                            
                            Text("\(String(format: "%0.1f", item.rate))")
                        }
                        .sheet (isPresented: $isShowingDetail) {
                            NavigationStack {
                                FavDetailView(favItem: $item)
                            }
                        }
                    }
                    
                }
                
            }
            .navigationTitle(Text("\(favCategory.label)"))
            .toolbar {
                ToolbarItem {
                    Button {
                        newItem = FavItem()
                        isAddingFavItem = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingFavItem) {
                FavItemModifier(favItem: $newItem, isNew: true)
                    .toolbar {
                        ToolbarItem (placement: .cancellationAction) {
                            Button("Cancel") {
                                isAddingFavItem = false
                            }
                        }
                        ToolbarItem {
                            Button {
                                var parent = favItemData.getBindingToData(favCategory)?.favItems
                                
                                isAddingFavItem = false
                            } label: {
                                Text("Add")
                            }
//                            .disabled(newItem.isEmpty)
                        }
                    }
            }
        }
    }
}

struct FavListView_Previews: PreviewProvider {
    static var previews: some View {
        FavListView(favItemData: FavSampleData(), favCategory: .constant(FavCategory())).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
