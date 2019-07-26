//
//  HomeConfigurator.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class HomeConfigurator: HomeConfiguratorProtocol {
    
    public static let sharedInstance = HomeConfigurator()
    
    func configure(_ view: HomeViewProtocol) {
        
        let dataManager = HomeDataManager()
        let interactor = HomeInteractor()
        
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        
        let router = HomeRouter(view: view as! HomeViewController)
        let presenter = HomePresenter(view: view, router: router, interactor: interactor)
        
        interactor.presenter = presenter
        view.presenter = presenter
    }
}
