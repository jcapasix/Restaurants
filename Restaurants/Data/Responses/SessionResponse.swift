//
//  SessionResponse.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class SessionResponse: Codable{
    
    var token: String?
    
    private enum CodingKeys: String, CodingKey {
        case token = "access_token"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.token = try container.decode(String.self, forKey:.token)
    }
}
