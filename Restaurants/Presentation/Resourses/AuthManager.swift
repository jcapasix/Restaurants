//
//  AuthManager.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/26/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class AuthManager{
    
    private static let _sharedInstance = AuthManager()
    
    private let userDefaults = UserDefaults.standard
    
    static var sharedInstance: AuthManager{
        return _sharedInstance
    }
    
    //MARK: - TOKEN
    
    func isToken() -> Bool{
        guard Utils.isKeyPresentInUserDefaults(key: "token") else{
            return false
        }
        return true
    }
    
    func setToken(_ token: String){
        userDefaults.set(token, forKey: "token")
        userDefaults.synchronize()
    }
    
    func getToken() -> String{
        return userDefaults.string(forKey: "token") ?? ""
    }
    
}
