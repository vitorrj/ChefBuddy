//
//  ProductDAO.swift
//  Foodies
//
//  Created by Marco Amorosi on 10/11/2019.
//  Copyright © 2019 Marco Amorosi. All rights reserved.
//

import SQLite

class StorageDAO {
    
    private let storages = Table("storages")
    
    private let idSto = Expression<Int64>("idSto")
    private let temp = Expression<String?>("temp")
    private let exDate = Expression<String?>("exDate")

    
    static let instance = StorageDAO()
    private let db: Connection?
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/Stephencelis.sqlite3")

            //  deleteDatabase(filePath: "\(path)/Stephencelis.sqlite3")

            createTable()
        } catch {
            db = nil
            print ("Unable to open database")
        }
    }
    
    // use it carefully
    func deleteDatabase(filePath : String)
    {
            let filemManager = FileManager.default
            do {
                let fileURL = NSURL(fileURLWithPath: filePath)
                try filemManager.removeItem(at: fileURL as URL)
                print("Database Deleted!")
            } catch {
                print("Error on Delete Database!!!")
            }
    }
    
    func createTable() {
        do {
            try db!.run(storages.create(ifNotExists: true) { table in
                table.column(idSto, primaryKey: .autoincrement)
                table.column(temp)
                table.column(exDate)
                })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addSupplier(stemp: String?, sexDate: String?) -> String? {
        do {
            let insert = storages.insert(temp <- stemp, exDate <- sexDate)
            try db!.run(insert)
            
            return "Insert done"
        } catch {
            print("Insert failed")
            return nil
        }
    }
    
    func getStorages() -> [Storage] {
        var storages = [Storage]()
        
        do {
            for storage in try db!.prepare(self.storages) {
                storages.append(Storage(
                    idStorage: storage[idSto],
                    temp: storage[temp]!,
                    exDate: storage[exDate]!
                ))
            }
        } catch {
            print("Select failed")
        }
        
        return storages
    }
    
    func deleteStorages(sid: Int64) -> Bool {
        do {
            let storage = storages.filter(idSto == sid)
            try db!.run(storage.delete())
            return true
        } catch {
            print("Delete failed")
        }
        return false
    }
    
    
}
