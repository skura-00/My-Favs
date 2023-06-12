//
//  FavItemDetailView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/08.
//

import SwiftUI


struct FavItemDetailView: View {
    @Binding var favItem: FavItem
    @State private var isPresentingEditView = false
    
    var body: some View {
        NavigationStack {
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
            .toolbar {
                ToolbarItem {
                    Button("Edit") {
                        isPresentingEditView = true
                    }
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                FavItemEditView(favItem: $favItem, isPresentingEditView: $isPresentingEditView)
            }
        }
        
    }
    
    
}

struct FavDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavItemDetailView(favItem: .constant(FavItem.sampleData[0]))
    }
}
