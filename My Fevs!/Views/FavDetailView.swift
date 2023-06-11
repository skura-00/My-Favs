//
//  FavDetailView.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/08.
//

import SwiftUI

struct FavDetailView: View {
    @Binding var favItem: FavItem
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
                
                Text("\(String(format: "%0.1f", favItem.rate))")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
                Text("\(favItem.desc))")
                    .lineLimit(10)
                    .multilineTextAlignment(.leading)
            
                Spacer()
            
        }
        .frame(alignment: .topLeading)
        .navigationTitle(favItem.title)
            
    }
}

struct FavDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavDetailView(favItem: .constant(FavItem()))
            .environmentObject(FavSampleData())
    }
}
