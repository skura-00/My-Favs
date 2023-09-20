//
//  SQLiteDB.swift
//  My Favs!
//
//  Created by SK on 2023/07/12.
//

import SQLite
import Foundation

class SQLiteDB {
    
    static let DBName = "FavsDB"
    static let fileName = "favs.sqlite3"
    
    private let favCategory = Table("FavCategory")
    private let favItem = Table("FavItem")
    private let tags = Table("Tags")
    
    // FavCategory
    private let categoryId = Expression<Int64>("categoryId")
    private let label = Expression<String>("label")
    
    // FavItem
    private let itemId = Expression<Int64>("itemId")
    private let title = Expression<String>("title")
    private let rate = Expression<Double>("rate")
    private let desc = Expression<String>("description")
    private let date = Expression<Date>("date")
    
    // Tags
//    private let tagId = Expression<Int64>("tagId")
//    private let name = Expression<String>("name")
    
    // Item Tags
    
    static let shared = SQLiteDB()
    
    private var db: Connection? = nil
    
    private init() {
        if let manager = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dirPath = manager.appendingPathComponent(Self.DBName)

            do {
                try FileManager.default.createDirectory(atPath: dirPath.path, withIntermediateDirectories: true, attributes: nil)
                let dbPath = dirPath.appendingPathComponent(Self.fileName).path
                db = try Connection(dbPath)
                
//                try db?.run(favItem.drop(ifExists: true))
//                try db?.run(favCategory.drop(ifExists: true))
//                try db?.run(tags.drop(ifExists: true))
                
                createFavCategoryTable()
                createFavItemTable()
//                createTagsTable()
                print("SQLiteDB initialized successfully at: \(dbPath) ")
            } catch {
                db = nil
                print("SQLiteDB initialization error: \(error)")
            }
        } else {
            db = nil
        }
    }
    
    
    func createFavCategoryTable() {
        guard let database = db else {
            return
        }
        
        // CREATE TABLE FavCategory
        do {
            try database.run(favCategory.create { table in
                table.column(categoryId, primaryKey: .autoincrement)
                table.column(label)
            })
            print("Category Table created successfully")
        } catch {
            print(error)
        }
    }
    
    func createFavItemTable() {
        guard let database = db else {
            return
        }
        
        db?.foreignKeys = true
        // CREATE TABLE FavItem
        do {
            try database.run(favItem.create { table in
                table.column(itemId, primaryKey: .autoincrement)
                table.column(title)
                table.column(rate)
                table.column(desc)
                table.column(date)
                table.column(categoryId)
                table.foreignKey(categoryId, references: favCategory, categoryId, delete: .cascade)
            })
            print("FavItem Table created successfully")
        } catch {
            print("Error: \(error)")
        }
    }
        
    func insertCategory(label: String) -> Int64? {
        guard let database = db else { return nil }

        let insert = favCategory.insert(self.label <- label)

        do {
            let id = try database.run(insert)
            print("Category added successfully: ID = \(id)")
            return id
        } catch {
            print(error)
            return nil
        }
    }
    
    func insertItem(title: String, categoryId: Int64, rate: Double, desc: String, date: Date) -> Int64? {
        guard let database = db else { return nil }

        let insert = favItem.insert(
            self.title <- title,
            self.rate <- rate,
            self.desc <- desc,
            self.date <- date,
            self.categoryId <- categoryId
        )

        do {
            let id = try database.run(insert)
            print("Item added successfully: ID = \(id)")
            return id
        } catch {
            print(error)
            return nil
        }
    }

    

    func getAllCategories() -> [FavCategory] {
        var categories: [FavCategory] = []
        guard let database = db else { return [] }

        do {
            for category in try database.prepare(self.favCategory) {
                categories.append(FavCategory(categoryId: Int64(category[categoryId]), label: category[label], favItems: getAllItems(id: category[categoryId])))
            }
        } catch {
            print(error)
        }
        return categories
    }
    
    func getCategory(categoryId: Int64) -> FavCategory? {
        let categories = getAllCategories()
        
        for category in categories {
            if (categoryId == category.categoryId) {
                return category
            }
        }
        
        return nil
    }
    
    func getAllItems(id: Int64) -> [FavItem] {
        var items: [FavItem] = []
        guard let database = db else { return [] }
        
        do {
            for item in try database.prepare(self.favItem) {
                if (id == item[categoryId]) {
                    items.append(FavItem(itemId: Int64(item[itemId]), categoryId: item[categoryId], title: item[title], rate: item[rate], desc: item[desc]))
                    
                }
            }
        } catch {
           print(error)
        }
        return items
    }
    
    
    func getItem(categoryId: Int64, itemId: Int64) -> FavItem {
        let items: [FavItem] = getAllItems(id: categoryId)
        
        for item in items {
            if (item.itemId == itemId && item.categoryId == categoryId) {
               return item
            }
        }
        
        return items[0]
    }
    
    func getItemCount(id: Int64) -> Int {
        let items = getAllItems(id: id)
        return items.count
    }
    
    
    
    
    func findItem(id: Int64, categoryId: Int64) -> FavItem? {
        let favItem: FavItem = FavItem(itemId: Int64(id), categoryId: Int64(categoryId), title: "", rate: Double(), desc: "", date: Date())
        guard let database = db else { return nil }

        let filter = self.favItem.filter(itemId == id)
        do {
            for item in try database.prepare(filter) {
                favItem.title = item[title]
                favItem.rate = item[rate]
                favItem.desc = item[desc]
                favItem.date = item[date]
            }
        } catch {
            print(error)
        }
        return favItem
    }

    func update(categoryId: Int64, itemId: Int64, title: String, rate: Double, desc: String) -> Bool {
        guard let database = db else { return false }

        let item = favItem.filter(self.categoryId == categoryId && self.itemId == itemId)
        do {
            let update = item.update([
                self.title <- title,
                self.rate <- rate,
                self.desc <- desc
            ])
            if try database.run(update) > 0 {
                return true
            }
        } catch {
            print(error)
        }
        return false
    }
    
    func deleteFavCategory(id: Int64) -> Bool {
        guard let database = db else {
            return false
        }
        do {
            let filter = favCategory.filter(self.categoryId == id)
            try database.run(filter.delete())
            return true
        } catch {
            print(error)
            return false
        }
    }

    func deleteFavItem(categoryId: Int64, itemId: Int64) -> Bool {
        guard let database = db else {
            return false
        }
        do {
            let filter = favItem.filter(self.categoryId == categoryId && self.itemId == itemId)
            try database.run(filter.delete())
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func deleteItemTable() -> Bool {
        guard let database = db else { return false }
        
        do {
            try database.run(
                favItem.drop(ifExists: true)
            )
            
            print("FavItem table deleted successfully")
            return true
        } catch {
            print("Error: \(error)")
            return false
        }
    }
    
    func deleteCategoryTable() -> Bool {
        guard let database = db else { return false }
        
        do {
            try database.run(
                favCategory.drop(ifExists: true)
            )
            
            print("FavCategory table deleted successfully")
            return true
        } catch {
            print("Error: \(error)")
            return false
        }
    }
    
    
//    func createTagsTable() {
//        guard let database = db else {
//            return
//        }
//
//        // CREATE TABLE Tags
//        do {
//            try database.run(tags.create { table in
//                table.column(tagId, primaryKey: .autoincrement)
//                table.column(name)
//            })
//            print("Tags Table created successfully")
//        } catch {
//            print(error)
//        }
//    }
//
//
//    func insertTag(name: String) -> Int64? {
//        guard let database = db else { return nil }
//
//        let insert = tags.insert(self.name <- name)
//
//        do {
//            let id = try database.run(insert)
//            print("Tag added successfully: ID = \(id)")
//            return id
//        } catch {
//            print(error)
//            return nil
//        }
//    }
//
//    func insertItemTag(itemId: Int64, tagId: Int64) {
//    }
//
//    func getAllTags() -> [Tag] {
//        var tags: [Tag] = []
//        guard let database = db else { return [] }
//
//        do {
//            for tag in try database.prepare(self.tags) {
//                tags.append(Tag(tagId: tag[tagId], name: tag[name]))
//            }
//        } catch {
//           print(error)
//        }
//        return tags
//    }
//
//    func deleteTag(tagId: Int64) -> Bool {
//        guard let database = db else {
//            return false
//        }
//        do {
//            let filter = tags.filter(self.tagId == tagId)
//            try database.run(filter.delete())
//            print("tag deleted")
//            return true
//        } catch {
//            print(error)
//            return false
//        }
//    }

}

