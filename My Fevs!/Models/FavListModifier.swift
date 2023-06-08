//
//  FavlistModifier.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/08.
//
import SwiftUI

struct FavListModifier: View {
    @Binding var favListItem: FavListItem
    @State var isNew = false
    
    @Environment(\.dismiss) private var dismiss
    @FocusState var focusedTask: FavItem?
//    @State private var isPickingSymbol = false

    var body: some View {
        List {
            HStack {
//                Button {
//                    isPickingSymbol.toggle()
//                } label: {
//                    Image(systemName: event.symbol)
//                        .imageScale(.large)
//                        .foregroundColor(Color(event.color))
//                }
//                .buttonStyle(.plain)
//                .padding(.horizontal, 5)

                TextField("New Category", text: $favListItem.label)
                    .font(.title2)
            }
            .padding(.top, 5)
            
            
            Text("List")
                .fontWeight(.bold)
            
            ForEach($favListItem.favItems) { $item in
                FavItemRow(favList: favListItem)
            }
            .onDelete(perform: { indexSet in
                favListItem.favItems.remove(atOffsets: indexSet)
            })

            
        }

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
        FavListModifier(favListItem: .constant(FavListItem()), isNew: true)
            .environmentObject(FavSampleData())
    }
}
