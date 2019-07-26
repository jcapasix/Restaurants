//
//  Utils.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/26/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class Utils{
    
    static func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
