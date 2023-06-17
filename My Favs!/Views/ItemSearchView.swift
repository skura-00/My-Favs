//
//  ItemSearchView.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/06/17.
//

import SwiftUI

struct ItemSearchView: View {
    @State var keyword = String()
    
    var body: some View {
        VStack {
            List {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField(" Keyword", text: $keyword)
                        .border(Color.gray, width: 1)
                        .padding()
                    Button("Search") {
                        
                    }
                }
                
                
            }
            
            HStack {
                NavigationLink(destination: CategoryListView(favCategoryData: .constant(FavsStorage().FavData), saveAction: {})) {
                    Image(systemName: "tray.2")
                        .font(.system(size: 30))
                        .padding(.horizontal, 20)
                        .foregroundColor(Color.gray)
                }
                
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 30))
                    .padding(.horizontal, 20)
                    .foregroundColor(Color.orange)
            
            }
            .padding(8)
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct ItemSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearchView()
    }
}
