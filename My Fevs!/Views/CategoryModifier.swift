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
    
    @Environment(\.presentationMode) var presentationMode
    @FocusState var focusedTask: FavItem?
    @State private var isPickingIcon = false

    var body: some View {
        NavigationSplitView {
            List {
                HStack {
                    Button {
                        isPickingIcon.toggle()
                    } label: {
                        Image(systemName: favCategory.icon)
                            .imageScale(.large)                }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 5)
                    
                    TextField("New Category", text: $favCategory.label)
                        .font(.title2)
                }
            }
            
        } detail: {
            ZStack {
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

