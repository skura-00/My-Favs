//
//  SQLiteDB.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/07/12.
//

import Foundation
import SQLite3


class SQLiteDB {
    static let SDB = SQLiteDB()
    
    private let file = "FavData.sqlite"
    private var db: OpaquePointer?
    
    private init() {
        db = openDatabase()
    }
    
    private func openDatabase() -> OpaquePointer? {
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(file)
        
        var db: OpaquePointer? = nil
        if sqlite3_open(url.path, &db) != SQLITE_OK {
            print("Failed: cannot open database")
            return nil
        } else {
            print("Success: connected to database")
            return db
        }
    }
}
