//
//  CategoryEditView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/11.
//

import SwiftUI

struct CategoryEditView: View {
    @Binding var favCategory: FavCategory
    @State private var isPickingIcon = false
    
    var body: some View {
        VStack {
            Form {
                Section (header: Text("Category Title")) {
                    TextField("New Category", text: $favCategory.label)
                        .font(.title2)
                }
            }
        
        }
        .foregroundColor(Color.black)
    }
}

struct CategoryEditView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryEditView(favCategory: .constant(FavCategory.sampleData[0]))
    }
}
