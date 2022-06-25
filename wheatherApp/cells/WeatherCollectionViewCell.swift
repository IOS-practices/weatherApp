//
//  WeatherCollectionViewCell.swift
//  wheatherApp
//
//  Created by admin on 6/23/22.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var weatherImage: UIImageView!
        
    @IBOutlet weak var cityNameWeather: UILabel!
    
    @IBOutlet weak var descriptionWeather: UILabel!
        
    @IBOutlet weak var temperatureWeather: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
