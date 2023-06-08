//
//  FavlistModifier.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/08.
//
import SwiftUI

struct FavCategoryModifier: View {
    @Binding var favListItem: FavCategory
    @State var isNew = false
    
    @Environment(\.dismiss) private var dismiss
    @FocusState var focusedTask: FavItem?
//    @State private var isPickingSymbol = false

    var body: some View {
        List {
//            HStack {
////                Button {
////                    isPickingSymbol.toggle()
////                } label: {
////                    Image(systemName: event.symbol)
////                        .imageScale(.large)
////                        .foregroundColor(Color(event.color))
////                }
////                .buttonStyle(.plain)
////                .padding(.horizontal, 5)
//            }
//            .padding(.top, 5)
            
            ForEach($favListItem.favItems) { $item in
                FavCategoryRow(favList: favListItem)
            }
            .onDelete(perform: { indexSet in
                favListItem.favItems.remove(atOffsets: indexSet)
            })

            
        }
        .navigationTitle($favListItem.label)

        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
//        .sheet(isPresented: $isPickingSymbol) {
//            SymbolPicker(event: $event)
//        }
    }
}

struct FavListModifier_Previews: PreviewProvider {
    static var previews: some View {
        FavCategoryModifier(favListItem: .constant(FavCategory()), isNew: true)
            .environmentObject(FavSampleData())
    }
}
