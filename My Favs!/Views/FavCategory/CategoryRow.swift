//
//  CategoryRow.swift
//  My Favs!
//
//  Created by SK on 2023/06/08.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var category: FavCategory
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color(colorScheme == .dark ? #colorLiteral(red: 0.02993695997, green: 0.1116794124, blue: 0.1822000444, alpha: 1) : .white)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(colorScheme == .dark ? .white : .black, lineWidth: 3)
                )
            
            VStack {
                
                Text(category.label)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                
                Text("\(category.favItems.count)")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 1, leading: 20, bottom: 10, trailing: 20))
            }
        }
        .padding()
        .frame(width: 180, height: 180)
        
    }
    
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow()
            .environmentObject(FavsList.sampleData[0])
            .preferredColorScheme(.dark)
    }
}
