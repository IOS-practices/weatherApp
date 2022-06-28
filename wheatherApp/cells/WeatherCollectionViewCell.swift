//
//  WeatherCollectionViewCell.swift
//  wheatherApp
//
//  Created by admin on 6/23/22.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var weatherImage: UIImageView!
        
    @IBOutlet weak var cityNameWeatherLabel: UILabel!
    
    @IBOutlet weak var descriptionWeatherLabel: UILabel!
        
    @IBOutlet weak var temperatureWeatherLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
