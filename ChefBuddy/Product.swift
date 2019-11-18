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
    var weight: Int64
    var idSup: Int64
    var image: String?
    var infoWeight: String?
    var remain: Int64
    
    
    internal init(idProd: Int64, name: String?, location: String?, idStor: Int64, weight: Int64, idSup: Int64, image: String?, infoWeight: String?, remain: Int64) {
        self.idProd = idProd
        self.name = name
        self.location = location
        self.idStor = idStor
        self.weight = weight
        self.idSup = idSup
        self.image = image	
        self.infoWeight = infoWeight
        self.remain = remain
    }
    
    

}

