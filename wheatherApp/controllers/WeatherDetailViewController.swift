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
                
        }

        if let url = URL(string: "https://countryflagsapi.com/png/\( weatherDetail?.sys.country ?? "Bolivia")") {
            flagImage.image = ImageManager.shared.loadFromUrl(urlWeather: url)
                }
        
        if let weatherDetail = weatherDetail {
            cityNameLabel.text = weatherDetail.name
        }
        
        if let weatherDetail = weatherDetail?.weather[0] {
            WeatherImageView.image = getWeatherImage(withUrl: weatherDetail.icon)
            descriptionLabel.text = weatherDetail.description
        }
        
        if let temperatureDetail = weatherDetail?.main {
            temperatureLabel.text = "\(temperatureDetail.temp) K"
        }
        
            
    }
    
    func getWeatherImage(withUrl: String) -> UIImage? {
        let url = URL(string:UrlManager.instance.urlWeatherImage(text: withUrl))
        let image = ImageManager.shared.loadFromUrl(urlWeather: url!)
        return image
    }
    
}

