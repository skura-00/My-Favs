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
        VStack {
            Text("\(favItem.title)")
                .fontWeight(.bold)
                .font(.system(size: 30))
            Text("\(String(format: "%0.1f", favItem.rate))")
        }
        .ignoresSafeArea(.all)
    }
}

struct FavDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavDetailView(favItem: .constant(FavItem()))
            .environmentObject(FavSampleData())
    }
}
