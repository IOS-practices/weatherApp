//
//  WeatherDetailViewController.swift
//  wheatherApp
//
//  Created by admin on 6/26/22.
//

import UIKit
import UIKit.UILabel

class WeatherDetailViewController: UIViewController {
    
    //Images
    @IBOutlet weak var WeatherImageView: UIImageView!
    @IBOutlet weak var flagImage: UIImageView!
    
    // Labels -Descriptions
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Labels -Temperature
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    
    // Labels -Extras
    
    var weatherDetail: List?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }

    
    func setupData(){
            if let country = weatherDetail?.sys {
                countryLabel.text = "Country: \(country.country)"
                //let url = UrlManager.instance.urlFlag(text: country.country)
                //flagImageView.image = ImageManager.instance.readStringUrl(urlStr: url)
            }

            
            if let weatherDetail = weatherDetail {
                cityNameLabel.text = weatherDetail.name
            }
            if let temperatureDetail = weatherDetail?.main {
                temperatureLabel.text = "\(temperatureDetail.temp) K"
            }
            // pending image
            
    }
}

