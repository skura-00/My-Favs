//
//  My_Favs_App.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/07.
//

import SwiftUI

@main
struct My_Favs_App: App {
    @StateObject private var dataStorage = FavsStorage()
    
    var body: some Scene {
        WindowGroup {
            CategoryListView(favCategoryData: $dataStorage.FavData) {
                Task {
                    do {
                        try await dataStorage.save(FavData: dataStorage.FavData)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await dataStorage.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
        
    }
}
