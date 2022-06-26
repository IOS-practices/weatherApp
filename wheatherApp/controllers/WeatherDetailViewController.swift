//
//  WeatherDetailViewController.swift
//  wheatherApp
//
//  Created by admin on 6/26/22.
//

import UIKit
import UIKit.UILabel

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var WeatherImageView: UIImageView!
        
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet var countryLabel: UILabel!
    
    var listDetail: list?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }

    
    func setupData(){
            if let country = listDetail?.sys {
                countryLabel.text = "Country: \(country.country)"
                //let url = UrlManager.instance.urlFlag(text: country.country)
                //flagImageView.image = ImageManager.instance.readStringUrl(urlStr: url)
            }

        /*
            if let listDetail = listDetail {
                placeLabel.text = listDetail.name
            } */
            
            /*if let weatherDetail = listDetail?.weather[0] {
                weatherImageView.image = getWeatherImage(withUrl: weatherDetail.icon)
                descriptionLabel.text = weatherDetail.description
            }*/
            /*
            if let temperatureDetail = listDetail?.main {
                temperatureLabel.text = "\(temperatureDetail.temp) K"
            }*/
            
            
    }
}

