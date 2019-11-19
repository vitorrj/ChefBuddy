//
//  Product.swift
//  Foodies
//
//  Created by Marco Amorosi on 08/11/2019.
//  Copyright © 2019 Marco Amorosi. All rights reserved.
//

import Foundation

class Product {

    var idProd: Int64
    var name: String?
    var location: String?
    var idStor: Int64
    var bought: Int64   // last order
    var idSup: Int64
    var image: String?
    var infoWeight: String?
    var remain: Int64   // remaining stock
    var quick: Bool     // type of order
    
    
    internal init(idProd: Int64, name: String?, location: String?, idStor: Int64, bought: Int64, idSup: Int64, image: String?, infoWeight: String?, remain: Int64, quick: Bool) {
        self.idProd = idProd
        self.name = name
        self.location = location
        self.idStor = idStor
        self.bought = bought
        self.idSup = idSup
        self.image = image
        self.infoWeight = infoWeight
        self.remain = remain
        self.quick = quick
    }
    
    

}

