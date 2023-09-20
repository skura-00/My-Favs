//
//  My_Favs_App.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/07.
//

import SwiftUI

@main
struct My_Favs_App: App {
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(FavsList())
//                .environmentObject(TagsList())
        }
        
    }
}
