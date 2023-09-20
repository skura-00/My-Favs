//
//  NewFavItemSheet.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/11.
//

import SwiftUI

// word limit: https://medium.com/devtechie/setting-max-input-length-for-textfield-or-texteditor-in-swiftui-628f21b096ee
struct NewFavItemSheet: View {
    @EnvironmentObject var category: FavCategory
    @Binding var isPresentingNewItemView: Bool
    @ObservedObject var newItem = FavItem.emptyItem
    @State private var isSliding = false
    let wordLimit = 250
    
    var body: some View {
        let text = Binding(
            get: { newItem.desc },
            set: { newItem.desc = String($0.prefix(wordLimit))}
        )
        
        NavigationStack {
            Form {
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
                   .tint(.orange)

                   Text("\(String(format: "%0.1f", newItem.rate))")

               }
                
                Section (header: Text("Description")) {
                   TextField("Description", text: text, axis: .vertical)
                        .font(.title3)
                        .lineLimit(1...9)
                        .padding(5.0)
                        .frame(maxHeight: 200, alignment: .topLeading)

                    Text("\(text.wrappedValue.count)/\(wordLimit)")
                       .foregroundColor(Color.gray)
               }
                
                Section (header: Text("Tag")) {
                    
               }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresentingNewItemView = false
                    }
                    .foregroundColor(.gray)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        newItem.date = Date()
                        let id = SQLiteDB.shared.insertItem(title: newItem.title, categoryId: Int64(category.categoryId), rate: newItem.rate, desc: newItem.desc, date: newItem.date)
                        print("Add item is working")
                        if (id != nil) {
                            print("Item is added successfully in NewFavItemSheet")
                            category.favItems = SQLiteDB.shared.getAllItems(id: category.categoryId)
                        }
                        isPresentingNewItemView = false
                    }
                    .disabled(newItem.title.isEmpty)
                    .foregroundColor(newItem.title.isEmpty ? .gray : .orange)
                }
            }
        }
    }
}

struct TextFieldLimitModifer: ViewModifier {
    @Binding var value: String
    var length: Int

    func body(content: Content) -> some View {
        content
            .onReceive(value.publisher.collect()) {
                value = String($0.prefix(length))
            }
    }
}

extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifer(value: value, length: length))
    }
}

struct NewFavItemSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewFavItemSheet(isPresentingNewItemView: .constant(true))
            .environmentObject(FavCategory.sampleData[0])
    }
}
