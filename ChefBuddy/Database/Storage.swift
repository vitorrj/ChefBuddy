//
//  Storage.swift
//  Foodies
//
//  Created by Marco Amorosi on 15/11/2019.
//  Copyright © 2019 Marco Amorosi. All rights reserved.
//

import Foundation

class Storage {

    var idStorage: Int64
    var temp: String?
    var exDate: String?
    
    internal init(idStorage: Int64, temp: String?, exDate: String?) {
        self.idStorage = idStorage
        self.temp = temp
        self.exDate = exDate
    }
    
}
