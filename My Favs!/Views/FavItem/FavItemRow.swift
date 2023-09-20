//
//  FavItemRow.swift
//  My Favs!
//
//  Created by SK on 2023/07/24.
//

import SwiftUI

struct FavItemRow: View {
    @State var item: FavItem
    
    var body: some View {
        ZStack (alignment: .leading) {
            Color(uiColor: .white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 2)
                )
            
            HStack (alignment: .center) {
                Text("\(String(format: "%0.1f", item.rate))")
                    .foregroundColor(.orange)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                
                Text("\(item.title)")
                    .font(.title3)
                    .padding(.bottom, 1)
                    .foregroundColor(.black)
                
            }
            .padding(EdgeInsets(top: 20, leading: 14, bottom: 20, trailing: 14))
        }
        .frame(height: 20)
    }
}

struct FavItemRow_Previews: PreviewProvider {
    static var previews: some View {
        FavItemRow(item: FavsList.sampleData[0].favItems[0])
    }
}
