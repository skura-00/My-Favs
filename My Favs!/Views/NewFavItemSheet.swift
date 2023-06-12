//
//  NewFavItemSheet.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/11.
//

import SwiftUI

struct NewFavItemSheet: View {
    @Binding var category: FavCategory
    @Binding var isPresentingNewItemView: Bool
    @State private var newItem = FavItem.emptyItem
    @State private var isSliding = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    TextField("Title", text: $newItem.title)
                        .font(.title2)
                        .padding(5)
                }
                Section (header: Text("Rate")) {
                    Slider(
                        value: $newItem.rate,
                        in: 0...10,
                        onEditingChanged: { sliding in
                            isSliding = sliding
                        }
                    )
                    
                    Text("\(String(format: "%0.1f", newItem.rate))")
                    
                }
                
                Section (header: Text("Description")) {
                    TextField("Description", text: $newItem.desc)
                        .font(.title2)
                        .padding(5)
                        .frame(height: 300, alignment: .topLeading)
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresentingNewItemView = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        category.favItems.append(newItem)
                        isPresentingNewItemView = false
                    }
                }
            }
        }
        
    }
}

struct NewFavItemSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewFavItemSheet(category: .constant(FavCategory.sampleData[0]), isPresentingNewItemView: .constant(true))
    }
}
