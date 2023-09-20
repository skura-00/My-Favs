//
//  NewCategorySheet.swift
//  My Favs!
//
//  Created by SK on 2023/06/08.
//

import SwiftUI

struct NewCategorySheet: View {
    @ObservedObject var newCategory = FavCategory.emptyCategory
    @EnvironmentObject var favs: FavsList
    @Environment(\.colorScheme) var colorScheme
    @Binding var isPresentingNewCategoryView: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section (header: Text("Category Title")) {
                    TextField("New Category", text: $newCategory.label)
                        .font(.title2)
                }
            }
            .background(colorScheme == .dark ?  Color(#colorLiteral(red: 0.02993695997, green: 0.1116794124, blue: 0.1822000444, alpha: 1)) : Color(#colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)))
            .scrollContentBackground(.hidden)
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresentingNewCategoryView = false
                    }.foregroundColor(Color.gray)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        isPresentingNewCategoryView = false
                        let id = SQLiteDB.shared.insertCategory(label: newCategory.label)

                        if (id != nil) {
                            favs.categoryList = SQLiteDB.shared.getAllCategories()
                        }
                    }
                    .disabled(newCategory.label.isEmpty)
                    .foregroundColor(newCategory.label.isEmpty ? .gray : .orange)
                    
                }
            }
        }
        
    }
    
}

struct NewCategorySheet_Previews: PreviewProvider {
    static var previews: some View {
        NewCategorySheet(isPresentingNewCategoryView: .constant(true))
            .preferredColorScheme(.dark)
    }
}
