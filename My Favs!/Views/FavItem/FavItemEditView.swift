//
//  FavItemEditView.swift
//  My Favs!
//
//  Created by SK on 2023/06/12.
//

import SwiftUI

struct FavItemEditView: View {
    @EnvironmentObject var favItem: FavItem
    @Binding var isPresentingEditView: Bool
    @State private var isSliding = false
    let wordLimit = 250
    
    var body: some View {
        let text = Binding(
            get: { favItem.desc },
            set: { favItem.desc = String($0.prefix(wordLimit))}
        )
        
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: $favItem.title)
                        .font(.title3)
                        .padding(5)
                }
                .foregroundColor(.black)
                Section (header: Text("Rate")) {
                    Slider(
                        value: $favItem.rate,
                        in: 0...10,
                        onEditingChanged: { sliding in
                            isSliding = sliding
                        }
                    )
                    .tint(.orange)
                    
                    Text("\(String(format: "%0.1f", favItem.rate))")
                        .foregroundColor(.black)
                    
                }
                
                Section (header: Text("Description")) {
                    TextField("Description", text: $favItem.desc, axis: .vertical)
                        .font(.title3)
                        .lineLimit(1...9)
                        .padding(5.0)
                        .frame(maxHeight: 200, alignment: .topLeading)
                        .foregroundColor(.black)
                    
                    Text("\(text.wrappedValue.count)/\(wordLimit)")
                       .foregroundColor(Color.gray)
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresentingEditView = false
                    }
                    .foregroundColor(.gray)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Finish") {
                        favItem.date = Date()
                        if (SQLiteDB.shared.update(categoryId: favItem.categoryId, itemId: favItem.itemId, title: favItem.title, rate: favItem.rate, desc: favItem.desc)) {
                            print("Item is updated successfully")
                        }
                        isPresentingEditView = false
                    }
                    .disabled(favItem.title.isEmpty)
                    .foregroundColor(favItem.title.isEmpty ? .gray : .orange)
                }
            }
        }
    }
}

struct FavItemEditView_Previews: PreviewProvider {
    static var previews: some View {
        FavItemEditView(isPresentingEditView: .constant(true))
            .environmentObject(FavCategory.sampleData[0].favItems[0])
    }
}
