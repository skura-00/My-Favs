//
//  FavItemRow.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/07/24.
//

import SwiftUI

struct FavItemRow: View {
    var body: some View {
        ZStack (alignment: .leading) {
            Color(uiColor: .white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 3)
                )
            
            VStack (alignment: .leading) {
                Text("Title")
                    .font(.title3)
                    .padding(.bottom, 1)
                    .foregroundColor(.black)
                
                Text("10")
                    .foregroundColor(.orange)
                    .font(.subheadline)
            }
            .padding(EdgeInsets(top: 14, leading: 18, bottom: 14, trailing: 18))
        }
        .padding()
        .frame(height: 20)
    }
}

struct FavItemRow_Previews: PreviewProvider {
    static var previews: some View {
        FavItemRow()
    }
}
