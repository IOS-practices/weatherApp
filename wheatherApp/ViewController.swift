import UIKit
import CoreData

class ViewController: UIViewController {

    var weatherItemSearched: [List] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    public let weatherCellIdentifier = "WeatherCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
                
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        
        
        let uiNib = UINib(nibName: "WeatherCollectionViewCell", bundle: nil)
        collectionView.register(uiNib, forCellWithReuseIdentifier: weatherCellIdentifier)
        
    }
    
    
    func loadWeatherData(withText: String){
            guard let url = URL(string:UrlManager.instance.urlWeather(text: withText)) else { return }
            
            NetworkManager.shared.get(WeatherList.self, from: url) { result in
                switch result {
                    case .success(let data):
                    self.weatherItemSearched = data.List
                        self.collectionView.reloadData()
                        print("success")
                    
                    case .failure(let error):
                        print(error)
                        print("failure")
                    
                    let alert = UIAlertController(title: "Error", message: "Something went wrong. Please, try again", preferredStyle: .alert)
                                 alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                                 print("OK")
                             }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    
    func saveHistory(withIndex: Int, withName: String) {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.persistentContainer.viewContext
            
            guard let entity = NSEntityDescription.entity(forEntityName: "WeatherEntry", in: context) else { return }
            guard let history = NSManagedObject(entity: entity, insertInto: context) as? WeatherEntry else { return }
            
            history.date = Date()
            history.id = Int16.random(in: 1...1000)
            history.name = withName
            history.positionList = Int16(withIndex)            
            
            do {
                try context.save()
                print("Ready")
                
            } catch(let error) {
                print("Error", error)
            }
        }
    
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherItemSearched.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as? WeatherCollectionViewCell else {return UICollectionViewCell()}
        
        let cityname = weatherItemSearched[indexPath.row].name
        let weather = weatherItemSearched[indexPath.row].weather[0]
        let temp = weatherItemSearched[indexPath.row].main
        let countryName = weatherItemSearched[indexPath.row].sys
        
        
        cell.cityNameWeatherLabel.text = "\(cityname), \(countryName.country)"
        cell.descriptionWeatherLabel.text = "Weather: \(weather.description)"
        print(countryName.country)
        print(weather.description)
        cell.temperatureWeatherLabel.text = "Temperature: \(temp.temp) K"
        
        if let url = URL(string: "https://openweathermap.org/img/wn/\(weatherItemSearched[indexPath.row].weather[0].icon)@2x.png") {
            cell.weatherImage.image = ImageManager.shared.loadFromUrl(urlWeather: url)
                }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 1
        let height = collectionView.frame.width / 3
        return CGSize(width: width, height: height)
    }
}

