//
//  CategoryRow.swift
//  My Feas!
//
//  Created by Sachi Kurata on 2023/06/08.
//

import SwiftUI

struct CategoryRow: View {
    let category: FavCategory
    
    var body: some View {
        ZStack {
            Color(uiColor: .white)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 3)
                )
            
            VStack {
                
                Text(category.label)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                    .foregroundColor(.black)
                
                Text(hasItem() ? "\(category.favItems.count)" : "\(0)")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 1, leading: 20, bottom: 10, trailing: 20))
            }
        }
        .padding()
        .frame(width: 180, height: 180)
        
    }
    
    func hasItem() -> Bool {
        return category.favItems.count > 0
    }
    
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(category: FavCategory.sampleData[0])
    }
}
