//
//  HomeRouter.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    
    fileprivate weak var view: HomeViewController?
    
    init(view: HomeViewController) {
        self.view = view
    }
    
    func routeToDetailRestaurant() {
        print("routeToDetailRestaurant")
    }
}
