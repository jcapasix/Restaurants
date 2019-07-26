//
//  Configuration.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Alamofire

enum Enviroment: String{
    case PROD
    case DEV
}

public protocol Configuration {
    static var serverURL: String { get }
    static var clientId: String { get }
    static var clientSecret: String { get }
    static var environment: String { get }
}

public struct ProductionConfig: Configuration {
    public static let serverURL         = "http://stg-api.pedidosya.com/public/v1"
    public static var clientId          = "trivia_f"
    public static var clientSecret      = "PeY@@Tr1v1@943"
    public static let environment       = Enviroment.PROD.rawValue
}

public struct DevelopConfig: Configuration {
    public static let serverURL         = "http://stg-api.pedidosya.com/public/v1"
    public static var clientId          = "trivia_f"
    public static var clientSecret      = "PeY@@Tr1v1@943"
    public static let environment       = Enviroment.DEV.rawValue
}

class AppEnvironment{
    
    static var configuration: Configuration.Type{
        #if DEVELOPMENT
        return DevelopConfig.self
        #else
        return ProductionConfig.self
        #endif
    }
    //static var headers:Headers?
}


//"clientId" : AppEnvironment.configuration.apiKey,
//"clientSecret" : "PeY@@Tr1v1@943"
