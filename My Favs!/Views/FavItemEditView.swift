//
//  FavItemEditView.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/12.
//

import SwiftUI
import Combine

struct FavItemEditView: View {
    @Binding var favItem: FavItem
    @Binding var isPresentingEditView: Bool
    @State private var isSliding = false
    
    private let wordLimit = 250
    
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
                    TextField("Description", text: $favItem.desc, axis: .vertical)
                        .lineLimit(1...9)
                        .padding(5.0)
                        .frame(maxHeight: 200, alignment: .topLeading)
                        .onReceive(Just(favItem.desc)) { _ in
                            if (favItem.desc.count <= wordLimit) {
                                favItem.desc = String(favItem.desc.prefix(wordLimit))
                            }
                        }
                    
                    Text("\(favItem.desc.count)/\(wordLimit)")
                        .foregroundColor(Color.gray)
                
                    
                }
            }
            .foregroundColor(Color.black)
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
        .foregroundColor(Color.orange)
    }
}

struct FavItemEditView_Previews: PreviewProvider {
    static var previews: some View {
        FavItemEditView(favItem: .constant(FavItem.sampleData[0]), isPresentingEditView: .constant(true))
    }
}
