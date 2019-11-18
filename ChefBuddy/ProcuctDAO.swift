//
//  ProductDAO.swift
//  Foodies
//
//  Created by Marco Amorosi on 10/11/2019.
//  Copyright © 2019 Marco Amorosi. All rights reserved.
//

import SQLite

class ProductDAO {
    
    private let products = Table("products")
    
    private let idProd = Expression<Int64>("idProd")
    private let name = Expression<String?>("name")
    private let loc = Expression<String?>("location")
    private let idStor = Expression<Int64>("idStor")
    private let weight = Expression<Int64>("weight")
    private let idSup = Expression<Int64>("idSup")
    private let image = Expression<String?>("image")
    private let inWeight = Expression<String?>("infoWeight")
    private let remain = Expression<Int64>("remain")
    
    static let instance = ProductDAO()
    private let db: Connection?
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/Stephencelis.sqlite3")
            createTable()
        } catch {
            db = nil
            print ("Unable to open database")
        }
    }
    
    func createTable() {
        do {
            try db!.run(products.create(ifNotExists: true) { table in
                table.column(idProd, primaryKey: .autoincrement)
                table.column(name)
                table.column(loc)
                table.column(idStor)
                table.column(weight)
                table.column(idSup)
                table.column(image)
                table.column(inWeight)
                table.column(remain)
                })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addProduct(pname: String?, plocation: String?, pidStor: Int64, pweight: Int64, pidSup: Int64, pimage: String?, pinfoWeight: String?, premain: Int64) -> String? {
        do {
            let insert = products.insert(name <- pname, loc <- plocation, idStor <- pidStor, weight <- pweight, idSup <- pidSup, image <- pimage, inWeight <- pinfoWeight, remain <- premain)
            try db!.run(insert)
            
            return "Insert done"
        } catch {
            print("Insert failed")
            return nil
        }
    }
    
    func getProducts() -> [Product] {
        var products = [Product]()
        
        do {
            for product in try db!.prepare(self.products) {
                products.append(Product(
                    idProd: product[idProd],
                    name: product[name]!,
                    location: product[loc],
                    idStor: product[idStor],
                    weight: product[weight],
                    idSup: product[idSup],
                    image: product[image],
                    infoWeight: product[inWeight],
                    remain: product[remain]
                ))
            }
        } catch {
            print("Select failed")
        }
        
        return products
    }
    
    func deleteProduct(pid: Int64) -> Bool {
        do {
            let product = products.filter(idProd == pid)
            try db!.run(product.delete())
            return true
        } catch {
            print("Delete failed")
        }
        return false
    }
    
    func updateProduct(pid:Int64, newProduct: Product) -> Bool {
        let product = products.filter(idProd == pid)
        do {
            let update = product.update([
                name <- newProduct.name,
                loc <- newProduct.location,
                idStor <- newProduct.idStor,
                weight <- newProduct.weight,
                idSup <- newProduct.idSup,
                image <- newProduct.image,
                inWeight <- newProduct.infoWeight,
                remain <- newProduct.remain
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
