//
//  Routes.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//


enum Routes{
    
    case getToken
    case getRestaurants
    
    func getURL() -> String{
        
        let serverHost = AppEnvironment.configuration.serverURL
        
        switch self {
        case .getToken:
            return serverHost + "/tokens?clientId=\(AppEnvironment.configuration.clientId)&clientSecret=\(AppEnvironment.configuration.clientSecret)"
            
        case .getRestaurants:
            return serverHost + "/search/restaurants?point=\(DEFAULT_LOCATION)&country=1"
        }
    }
}
