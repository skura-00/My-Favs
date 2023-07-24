//
//  IconPickerView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/11.
//

import SwiftUI

struct IconPickerView: View {
    @Binding var category: FavCategory
    @State private var selectedColor: Color = FavCategoryColors.default
    
    var column = Array(repeating: GridItem(.flexible()), count: 5)
    
    var body: some View {
        VStack {
            Image(systemName: category.icon)
                .font(.title2)
                .imageScale(.large)
                .foregroundColor(selectedColor)
                .padding(.vertical, 30)
            
            Divider()
            
//            ColorPicker(selection: $selectedColor)
//            HStack {
//                ForEach(FavCategoryColors.all, id: \.self) { color in
//                    Button {
//                        selectedColor = color
//                        category.color = color.rgbaColor
//                    } label: {
//                        Circle()
//                            .foregroundColor(color)
//                    }
//                }
//            }
//            .padding(.horizontal)
//            .frame(height: 50)
            
            LazyVGrid(columns: column) {
                ForEach(FavCategoryIcons.iconNames, id: \.self) { icon in
                    Button (action: {
                        category.icon = icon
                    }) {
                        Image(systemName: icon)
                            .font(.title3)
                            .imageScale(.large)
                            .foregroundColor(selectedColor)
                            .padding(5)
                    }
                    
                }
            }
            .frame(maxHeight: .infinity)
        }
//        .onAppear {
//            selectedColor = Color(category.color)
//        }
    }
}

struct IconPickerView_Previews: PreviewProvider {
    static var previews: some View {
        IconPickerView(category: .constant(FavCategory.sampleData[0]))
    }
}
