//
//  ProductDAO.swift
//  Foodies
//
//  Created by Marco Amorosi on 10/11/2019.
//  Copyright © 2019 Marco Amorosi. All rights reserved.
//

import SQLite

class SupplierDAO {
    
    private let suppliers = Table("suppliers")
    
    private let idSup = Expression<Int64>("idSup")
    private let name = Expression<String?>("name")
    private let email = Expression<String?>("email")
    private let address = Expression<String?>("address")

    
    static let instance = SupplierDAO()
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
            try db!.run(suppliers.create(ifNotExists: true) { table in
                table.column(idSup, primaryKey: .autoincrement)
                table.column(name)
                table.column(email)
                table.column(address)
                })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addSupplier(sname: String?, semail: String?, saddress: String?) -> String? {
        do {
            let insert = suppliers.insert(name <- sname, email <- semail, address <- saddress)
            try db!.run(insert)
            
            return "Insert done"
        } catch {
            print("Insert failed")
            return nil
        }
    }
    
    func getSuppliers() -> [Supplier] {
        var suppliers = [Supplier]()
        
        do {
            for supplier in try db!.prepare(self.suppliers) {
                suppliers.append(Supplier(
                    idSup: supplier[idSup],
                    nameSup: supplier[name]!,
                    email: supplier[email]!,
                    address: supplier[address]!
                ))
            }
        } catch {
            print("Select failed")
        }
        
        return suppliers
    }
    
    func deleteSupplier(sid: Int64) -> Bool {
        do {
            let supplier = suppliers.filter(idSup == sid)
            try db!.run(supplier.delete())
            return true
        } catch {
            print("Delete failed")
        }
        return false
    }
    
    func updateSupplier(sid:Int64, newSupplier: Supplier) -> Bool {
        let supplier = suppliers.filter(idSup == sid)
        do {
            let update = supplier.update([
                name <- newSupplier.nameSup,
                email <- newSupplier.email,
                address <- newSupplier.address
                ])
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }
        
        return false
    }
}
