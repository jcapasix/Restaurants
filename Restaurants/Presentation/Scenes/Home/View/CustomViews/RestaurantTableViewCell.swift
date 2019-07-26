//
//  RestaurantTableViewCell.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/26/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(restaurant: Restaurant){
        self.nameLabel.text = restaurant.name!
        self.addressLabel.text = restaurant.address
    }
    
}
