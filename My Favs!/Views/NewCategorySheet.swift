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
                .foregroundColor(Color.black)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewCategoryView = false
                        }.foregroundColor(Color.gray)
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            favData.append(newCategory)
                            isPresentingNewCategoryView = false
                        }
                        .foregroundColor(addButtonColor)
                        .disabled(labelIsEmpty)
                        
                    }
                }
        }
        
        
    }
    
    var labelIsEmpty: Bool {
        return newCategory.label.isEmpty
    }
    
    var addButtonColor: Color {
        return labelIsEmpty ? .gray : .orange
    }
}

struct FavListModifier_Previews: PreviewProvider {
    static var previews: some View {
        NewCategorySheet(favData: .constant(FavCategory.sampleData), isPresentingNewCategoryView: .constant(true))
    }
}

