//
//  SettingView.swift
//  My Favs!
//
//  Created by SK on 2023/09/01.
//

import SwiftUI

struct SettingView: View {
    @StateObject var toRoot: ToRoot = ToRoot()
    @EnvironmentObject var favsList: FavsList
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @State var isDropSelected = false
    
    var body: some View {
        TabView (selection: $toRoot.selected) {
            Form {
                Button(action: { isDropSelected = true }, label: {
                    Text("Delete all categories")
                        .foregroundColor(.red)
                })
                .confirmationDialog("Are you sure to delete all categories?", isPresented: $isDropSelected, titleVisibility: .visible) {
                    Button("Delete") {
                        if(SQLiteDB.shared.deleteItemTable() && SQLiteDB.shared.deleteCategoryTable()) {
                            SQLiteDB.shared.createFavCategoryTable()
                            SQLiteDB.shared.createFavItemTable()
                            favsList.categoryList = SQLiteDB.shared.getAllCategories()
                        }
                        isDropSelected = false
                    }
                    
                    Button("Cancel") {
                        isDropSelected = false
                    }
                }
            }
            .padding()
            .scrollDisabled(true)
            .scrollContentBackground(.hidden)
            .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.02993695997, green: 0.1116794124, blue: 0.1822000444, alpha: 1)) : Color(#colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)))
        }
        .accentColor(colorScheme == .dark ? .white : .black)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
            SettingView()
                .environmentObject(FavsList())
                .preferredColorScheme(.dark)
        
    }
}
