//
//  Bought.swift
//  Foodies
//
//  Created by Marco Amorosi on 15/11/2019.
//  Copyright © 2019 Marco Amorosi. All rights reserved.
//

import Foundation

class Bought {

    var idBought: Int64
    var data: Date?
    var idOrder: Int64
    var idProduct: Int64
    var bought: Int64
    var weight: Int64
    
    internal init(idBought: Int64, data: Date?, idOrder: Int64, idProduct: Int64, bought: Int64, weight: Int64) {
        self.idBought = idBought
        self.data = data
        self.idOrder = idOrder
        self.idProduct = idProduct
        self.bought = bought
        self.weight = weight
    }
    
}
