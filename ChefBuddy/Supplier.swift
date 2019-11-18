//
//  Supplier.swift
//  Foodies
//
//  Created by Marco Amorosi on 08/11/2019.
//  Copyright © 2019 Marco Amorosi. All rights reserved.
//

import Foundation

class Supplier {

    var idSup: Int64
    var nameSup: String?
    var email: String?
    var address: String?
    
    init(idSup: Int64, nameSup: String, email: String, address: String) {
        self.idSup = idSup
        self.nameSup = nameSup
        self.email = email
        self.address = address
    }
}
