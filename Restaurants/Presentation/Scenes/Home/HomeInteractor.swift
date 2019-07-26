//
//  HomeInteractor.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import SVProgressHUD

class HomeInteractor: HomeInteractorProtocol {
    
    var dataManager: HomeDataManagerProtocol!
    var presenter: HomePresenterProtocol!
    
//    func newCustomer(customer:Customer){
//        self.dataManager.newCustomer(customer: customer)
//    }
//
//    func logoutUser(){
//        SVProgressHUD.show()
//
//        let loginManager = LoginManager()
//
//        self.presenter.logoutConfirm(rpt: true)
//    }
    
    func showError(code: String){
        self.presenter.showError(code: code)
    }
    
    func getToken() {
        self.dataManager.getToken()
    }
    
    func successToken(token: String){
        AuthManager.sharedInstance.setToken(token)
        self.presenter.successToken()
    }
    
    func getRestaurants() {
        self.dataManager.getRestaurants()
    }
    
    func showRestaurants(restaurant: [Restaurant]) {
        self.presenter.showRestaurants(restaurant: restaurant)
    }
    
}
