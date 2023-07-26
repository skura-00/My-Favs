//
//  NewFavItemSheet.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/11.
//

import SwiftUI
import Combine

struct NewFavItemSheet: View {
    @Binding var category: FavCategory
    @Binding var isPresentingNewItemView: Bool
    @State private var newItem = FavItem.emptyItem
    @State private var isSliding = false
    let wordLimit = 250
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    TextField("Title", text: $newItem.title)
                        .font(.title3)
                        .padding(5)
                }
                Section (header: Text("Rate")) {
                    Slider(
                        value: $newItem.rate,
                        in: 0...10,
                        onEditingChanged: { sliding in
                            isSliding = sliding
                        }
                    )
                    
                    Text("\(String(format: "%0.1f", newItem.rate))")
                    
                }
                
                Section (header: Text("Description")) {
                    TextField("Description", text: $newItem.desc, axis: .vertical)
                        .lineLimit(1...9)
                        .padding(5.0)
                        .frame(maxHeight: 200, alignment: .topLeading)
                        .onReceive(Just(newItem.desc)) { _ in
                            if (newItem.desc.count <= wordLimit) {
                                newItem.desc = String(newItem.desc.prefix(wordLimit))
                            }
                        }
                    
                    Text("\(newItem.desc.count)/\(wordLimit)")
                        .foregroundColor(Color.gray)
                }
            }
            .foregroundColor(Color.black)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresentingNewItemView = false
                    }
                    .foregroundColor(.gray)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        category.favItems.append(newItem)
                        newItem.date = Date()
                        isPresentingNewItemView = false
                    }
                    .foregroundColor(titleIsEmpty ? .gray : .orange)
                    .disabled(titleIsEmpty)
                }
            }
        }
        .foregroundColor(Color.orange)
        
    }
    
    
    var titleIsEmpty: Bool {
        return newItem.title.isEmpty
    }
    
}

struct NewFavItemSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewFavItemSheet(category: .constant(FavCategory.sampleData[0]), isPresentingNewItemView: .constant(true))
    }
}
