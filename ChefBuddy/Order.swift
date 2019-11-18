//
//  Quantity.swift
//  Foodies
//
//  Created by Marco Amorosi on 08/11/2019.
//  Copyright © 2019 Marco Amorosi. All rights reserved.
//

import Foundation


class Order {

    var idOrder: Int64
    var info: String?

    internal init(idOrder: Int64, info: String?) {
        self.idOrder = idOrder
        self.info = info
    }

}
