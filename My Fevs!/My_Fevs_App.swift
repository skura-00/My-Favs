//
//  My_Fevs_App.swift
//  My Fevs!
//
//  Created by 倉田沙智 on 2023/06/07.
//

import SwiftUI

@main
struct My_Fevs_App: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var sampleData = FavSampleData()

    var body: some Scene {
        WindowGroup {
            FavListView(favItemData: sampleData)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
        }
    }
}
