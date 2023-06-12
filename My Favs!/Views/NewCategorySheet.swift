//
//  NewCategorySheet.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/08.
//
import SwiftUI

struct NewCategorySheet: View {
    @State private var newCategory = FavCategory.emptyCategory
    @Binding var favData: [FavCategory]
    @Binding var isPresentingNewCategoryView: Bool
    

    var body: some View {
        NavigationStack {
            CategoryEditView(favCategory: $newCategory)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewCategoryView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            favData.append(newCategory)
                            isPresentingNewCategoryView = false
                        }
                    }
                }
        }
        
    }
}

struct FavListModifier_Previews: PreviewProvider {
    static var previews: some View {
        NewCategorySheet(favData: .constant(FavCategory.sampleData), isPresentingNewCategoryView: .constant(true))
    }
}

