//
//  ProductDAO.swift
//  Foodies
//
//  Created by Marco Amorosi on 10/11/2019.
//  Copyright © 2019 Marco Amorosi. All rights reserved.
//

import SQLite

class LocationDAO {

    private let locations = Table("locations")

    private let idLoc = Expression<Int64>("idLoc")
    private let nameLoc = Expression<String?>("nameLoc")



    static let instance = LocationDAO()
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
            try db!.run(locations.create(ifNotExists: true) { table in
                table.column(idLoc, primaryKey: .autoincrement)
                table.column(nameLoc)
                })
        } catch {
            print("Unable to create table")
        }
    }

    func addLocation(lnamLoc: String?) -> String? {
        do {
            let insert = locations.insert(nameLoc <- lnamLoc)
            try db!.run(insert)

            return "Insert done"
        } catch {
            print("Insert failed")
            return nil
        }
    }

    func getLocations() -> [Location] {
        var locations = [Location]()

        do {
            for location in try db!.prepare(self.locations) {
                locations.append(Location(
                    idLoc: location[idLoc],
                    nameLoc: location[nameLoc]!
                ))
            }
        } catch {
            print("Select failed")
        }

        return locations
    }


    func getLocationsName() -> [String] {
        var locationsName = [String]()
        do {
            for location in try db!.prepare(self.locations) {
                locationsName.append(location[nameLoc]!)
            }
        } catch {
            print("Select failed")
        }
        return locationsName
    }


    func deleteLocation(lid: Int64) -> Bool {
        do {
            let location = locations.filter(idLoc == lid)
            try db!.run(location.delete())
            return true
        } catch {
            print("Delete failed")
        }
        return false
    }

}
