//
//  HomeProtocols.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol! { get set }
    func showRestaurants(restaurants: [Restaurant])
}

protocol HomePresenterProtocol: class {
    var router: HomeRouterProtocol { get }
    var interactor: HomeInteractorProtocol { get }
    func getToken()
    func successToken()
    func getRestaurants()
    func showRestaurants(restaurant:[Restaurant])
    func showError(code: String)
}

protocol HomeRouterProtocol {
    func routeToDetailRestaurant()
}

protocol HomeConfiguratorProtocol {
    func configure(_ view: HomeViewProtocol)
}

protocol HomeInteractorProtocol{
    var presenter: HomePresenterProtocol! { get set }
    var dataManager: HomeDataManagerProtocol! { get set }
    func showError(code: String)
    func getToken()
    func successToken(token: String)
    func getRestaurants()
    func showRestaurants(restaurant:[Restaurant])
}

protocol HomeDataManagerProtocol{
    var interactor: HomeInteractorProtocol! { get set }
    func getToken()
    func getRestaurants()
}
