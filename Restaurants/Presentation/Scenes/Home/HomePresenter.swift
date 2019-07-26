//
//  HomePresenter.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class HomePresenter{
    
    fileprivate weak var view: HomeViewProtocol?
    internal let router: HomeRouterProtocol
    internal let interactor: HomeInteractorProtocol
    
    init(view: HomeViewProtocol, router: HomeRouterProtocol, interactor: HomeInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        if AuthManager.sharedInstance.isToken(){
            self.getRestaurants()
        }
        else{
            self.getToken()
        }
        
    }
    
}

extension HomePresenter: HomePresenterProtocol{
    func getToken() {
        self.interactor.getToken()
    }
    
    func successToken(){
        self.interactor.getRestaurants()
    }
    
    func getRestaurants() {
        self.interactor.getRestaurants()
    }
    
    func showRestaurants(restaurant: [Restaurant]) {
        self.view?.showRestaurants(restaurants: restaurant)
    }
    
    func showError(code: String){
        
        if code == Errors.invalidToken{
            self.getToken()
        }
        else{
            print("Error Desconocido! :)")
        }
    }
    
}
