//
//  IconPickerView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/11.
//

import SwiftUI

struct IconPickerView: View {
    @Binding var category: FavCategory
    
    var column = Array(repeating: GridItem(.flexible()), count: 5)
    
    var body: some View {
        VStack (alignment: .center) {
            Image(systemName: category.icon)
                .font(.title)
                .imageScale(.large)
                .foregroundColor(category.color)
            
            ColorPicker("", selection: $category.color, supportsOpacity: false)
                .padding()
            
            LazyVGrid(columns: column) {
                ForEach(FavCategoryIcons.iconNames, id: \.self) { icon in
                    Button (action: {
                        category.icon = icon
                    }) {
                        Image(systemName: icon)
                            .font(.title2)
                            .imageScale(.large)
                            .foregroundColor(category.color)
                            .padding()
                    }
                    
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

struct IconPickerView_Previews: PreviewProvider {
    static var previews: some View {
        IconPickerView(category: .constant(FavCategory.sampleData[0]))
    }
}
