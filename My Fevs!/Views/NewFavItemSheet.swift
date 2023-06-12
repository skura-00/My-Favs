//
//  NewFavItemSheet.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/11.
//

import SwiftUI

struct NewFavItemSheet: View {
    @State private var newItem = FavItem.emptyItem
    @Binding var category: FavCategory
    @Binding var isPresentingNewItemView: Bool
    
    var body: some View {
        NavigationStack {
            FavItemEditView(favItem: newItem)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewItemView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            category.favItems.append(newItem)
                            isPresentingNewItemView = true
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
