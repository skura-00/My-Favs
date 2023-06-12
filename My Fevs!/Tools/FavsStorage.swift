//
//  FavsStorage.swift
//  My Fevs!
//
//  Created by Sachi Kurata on 2023/06/11.
//

import SwiftUI

@MainActor
class FavsStorage: ObservableObject {
    @Published var FavData: [FavCategory] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("favData.data")
    }
        
    func load() async throws {
        let task = Task<[FavCategory], Error> {
            let fileURL = try Self.fileURL()
            
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            
            let favCategories = try JSONDecoder().decode([FavCategory].self, from: data)
            return favCategories
        }
        
        let FavData = try await task.value
        self.FavData = FavData
    }
    
    func save(FavData: [FavCategory]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(FavData)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        
        _ = try await task.value
    }
}
