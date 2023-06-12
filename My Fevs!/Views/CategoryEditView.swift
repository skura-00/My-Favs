//
//  CategoryEditView.swift
//  My Fevs!
//
//  Created by Sachi Kurata on 2023/06/11.
//

import SwiftUI

struct CategoryEditView: View {
    @Binding var favCategory: FavCategory
    @State private var isPickingIcon = false
    
    var body: some View {
        List {
            HStack {
                Button {
                    isPickingIcon.toggle()
                } label: {
                    Image(systemName: favCategory.icon)
                        .imageScale(.large)                }
                .buttonStyle(.plain)
                .padding(.horizontal, 5)
                
                TextField("New Category", text: $favCategory.label)
                    .font(.title2)
            }
        }
    }
}

struct CategoryEditView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryEditView(favCategory: .constant(FavCategory.sampleData[0]))
    }
}
