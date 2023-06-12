//
//  FavItemEditView.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/06/12.
//

import SwiftUI

struct FavItemEditView: View {
    @Binding var favItem: FavItem
    @Binding var isPresentingEditView: Bool
    @State private var isSliding = false
    
    var body: some View {
        NavigationStack {
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
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresentingEditView = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Finish") {
                        isPresentingEditView = false
                    }
                }
            }
        }
    }
}

struct FavItemEditView_Previews: PreviewProvider {
    static var previews: some View {
        FavItemEditView(favItem: .constant(FavItem.sampleData[0]), isPresentingEditView: .constant(true))
    }
}
