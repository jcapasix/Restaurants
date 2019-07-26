//
//  Connection.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Alamofire

class Connection: SessionManager {
    
    public static let sharedInstance = Connection()
    
    //var alamofireManager : Alamofire.SessionManager?
    let configuration = URLSessionConfiguration.default
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    
    private init() {
        super.init()
        self.configuration.timeoutIntervalForResource = 5
        //self.alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
}
