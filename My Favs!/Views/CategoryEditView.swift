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
            List {
                Button {
                    isPickingIcon.toggle()
                } label: {
                    Image(systemName: favCategory.icon)
                        .foregroundColor(Color(favCategory.color))
                        .imageScale(.large)
                        .font(.title3)
                }
                .buttonStyle(.plain)
                .padding(.vertical, 5)
                .frame(alignment: .center)
                
                TextField("New Category", text: $favCategory.label)
                    .font(.title2)
            }
            .sheet(isPresented: $isPickingIcon) {
                IconPickerView(category: $favCategory)
            }
        }
    }
}

struct CategoryEditView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryEditView(favCategory: .constant(FavCategory.sampleData[0]))
    }
}
