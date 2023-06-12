//
//  FavItemModifier.swift
//  My Fevs!
//
//  Created by Sachi Kurata on 2023/06/09.
//

import SwiftUI

struct FavItemEditView: View {
//    @Binding var favCategory: FavCategory
    @State var favItem: FavItem
    @State private var selection: FavItem?
    
    @State private var isSliding = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    TextField("Title", text: $favItem.title)
                        .font(.title2)
                        .padding(5)
                }
                Section (header: Text("Rate")) {
                    
                    Slider(
                        value: $favItem.rate,
                        in: 0...10,
                        onEditingChanged: { sliding in
                            isSliding = sliding
                        }
                    )
                    
                    Text("\(String(format: "%0.1f", favItem.rate))")
                    
                }
                
                Section (header: Text("Description")) {
                    TextField("Description", text: $favItem.desc)
                        .font(.title2)
                        .padding(5)
                        .frame(height: 300, alignment: .topLeading)
                    
                }
            }
            
        }
    }
        
    
}

struct FavItemModifier_Previews: PreviewProvider {
    static var previews: some View {
        FavItemEditView(favItem: FavItem.sampleData[0])
    }
}
