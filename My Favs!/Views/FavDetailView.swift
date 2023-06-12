//
//  FavDetailView.swift
//  My Fevs!
//
//  Created by Sachi Kurata on 2023/06/08.
//

import SwiftUI


struct FavDetailView: View {
    @Binding var favItem: FavItem
    var maxStar = 10
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Text("\(String(format: "%0.1f", favItem.rate))")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
            
                
            Text("\(favItem.desc)")
                .font(.body)
                    .lineLimit(10)
                    .multilineTextAlignment(.leading)
            
                Spacer()
            
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(.horizontal, 20)
        .navigationTitle(favItem.title)
            
    }
    
    
}

struct FavDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavDetailView(favItem: .constant(FavItem.sampleData[0]))
    }
}
