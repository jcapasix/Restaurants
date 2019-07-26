//
//  HomeViewController.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var presenter: HomePresenterProtocol!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var restaurants:[Restaurant] = []
    
    private var filterRestaurants:[Restaurant] = [Restaurant]()  {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = HomeConfigurator.sharedInstance.configure(self)
        self.initView()
    }
    
    func initView(){
        self.tableView.register(UINib(nibName: "RestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "RestaurantTableViewCell")
        
        self.title = "Restaurants"
    }

}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filterRestaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath as IndexPath) as! RestaurantTableViewCell
        cell.loadData(restaurant: self.filterRestaurants[indexPath.row])
        return cell
    }
    
    
}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let lowerSearchText = searchText.lowercased()
        
        self.filterRestaurants = searchText.isEmpty ? self.restaurants : self.restaurants.filter { restaurant -> Bool in
            return restaurant.name!.lowercased().hasPrefix(lowerSearchText)
        }
    }
}

extension HomeViewController: HomeViewProtocol{
    
    func showRestaurants(restaurants: [Restaurant]) {
        self.restaurants = restaurants
        self.filterRestaurants = restaurants
    }
}
