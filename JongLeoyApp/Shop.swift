//
//  Shop.swift
//  JongLeoyApp
//
//  Created by Jessica Chayavichitsilp on 1/17/16.
//  Copyright © 2016 Jessica Chayavichitsilp. All rights reserved.
//

import Foundation
import UIKit

class Shop {
    var name: String
    var photo: UIImage?
    var address: String
    var category: String
    
    init(name: String, address: String, photo: UIImage?, category: String) {
        self.name = name
        self.photo = photo
        self.address = address
        self.category = category
    }
}


