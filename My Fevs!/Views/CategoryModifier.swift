//
//  FavlistModifier.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/08.
//
import SwiftUI

struct CategoryModifier: View {
    @Binding var favCategory: FavCategory
    @State var isNew = false
    
    @State private var selection: FavCategory?
    
    @Environment(\.dismiss) private var dismiss
    @FocusState var focusedTask: FavItem?

    var body: some View {
        NavigationSplitView {
            List {
                
                ForEach($favCategory.favItems) { $item in
                    VStack (alignment: .leading) {
                        Text("\(item.title)")
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .padding(.bottom, 0.2)
                        
                        Text("\(String(format: "%0.1f", item.rate))")
                    }
                }
                .onDelete(perform: { indexSet in
                    favCategory.favItems.remove(atOffsets: indexSet)
                })

                
            }
            .navigationTitle($favCategory.label)

            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            
        } detail: {
            ZStack {
//                if let item = selection, let itemBinding = favListItem.getBindingToData(item) {
//                    FavCategoryModifier(favListItem: itemBinding)
//                } else {
//                    Text("Select an Event")
//                        .foregroundStyle(.secondary)
//                }
            }
        }
        
    }
}

struct FavListModifier_Previews: PreviewProvider {
    static var previews: some View {
        CategoryModifier(favCategory:.constant(FavCategory()), isNew: true)
            .environmentObject(FavSampleData())
    }
}

