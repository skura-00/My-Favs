//
//  FavItemModifier.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/09.
//

import SwiftUI

struct FavItemModifier: View {
//    @Binding var favCategory: FavCategory
    @Binding var favItem: FavItem
    @State var isNew = false
    
    @State private var selection: FavItem?
    
    @Environment(\.presentationMode) var presentationMode
    @FocusState var focusedTask: FavItem?
    @State private var isPickingIcon = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    TextField("Title", text: $favItem.title)
                        .font(.title2)
                        .padding(5)
                }
                Section (header: Text("Rate & Description")) {
                    TextField("Rate", value: $favItem.rate, format: .number)
                        .keyboardType(.numberPad)
                        .font(.title2)
                        .padding(5)
                
                    TextField("Description", text: $favItem.desc)
                        .font(.title2)
                        .padding(5)
                        .frame(height: 300, alignment: .topLeading)
                    
                }
                Section (header: Text("")) {
                    Button("Add") {
                        
                    }
                }
            }
            
        }
        
            
//            TextField("Title", text: $favItem.title)
//                .font(.title2)
    }
        
    
}

struct FavItemModifier_Previews: PreviewProvider {
    static var previews: some View {
        FavItemModifier(favItem: .constant(FavItem()))
            .environmentObject(FavSampleData())
    }
}
