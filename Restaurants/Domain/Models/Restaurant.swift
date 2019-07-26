//
//  Restaurant.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper

class Restaurant: Mappable{
    
    var name: String?
    var address: String?
    var logo: String?

    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.name <- map["name"]
        self.address <- map["address"]
        self.logo <- map["logo"]
    }
    
}
