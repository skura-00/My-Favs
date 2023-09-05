//
//  FavItemDetailView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/08.
//

import SwiftUI

struct FavItemDetailView: View {
    @EnvironmentObject var favItem: FavItem
    @State private var isPresentingEditView = false
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                HStack {
                    Text("\(String(format: "%0.1f", favItem.rate))")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical)
                    
                    Text("\(dateToString())")
                        .font(.caption)
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                }
                
                Text("\(favItem.desc)")
                    .font(.body)
                        .lineLimit(10)
                        .multilineTextAlignment(.leading)
                    Spacer()
            }
            .foregroundColor(Color.black)
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
                FavItemEditView(isPresentingEditView: $isPresentingEditView)
                    .environmentObject(favItem)
            }
        }
        .foregroundColor(Color.orange)
        
    }
    
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: favItem.date)
    }
    
}

struct FavItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavItemDetailView()
            .environmentObject(FavCategory.sampleData[0].favItems[0])
    }
}
