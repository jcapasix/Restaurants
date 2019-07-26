//
//  RestaurantsResponse.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/26/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper

class RestaurantsResponse: Mappable{
    
    var data: [Restaurant]?
    var message: [String]?
    var code: String?

    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.data <- map["data"]
        self.message <- map["message"]
        self.code <- map["code"]
    }
}
