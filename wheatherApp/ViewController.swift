//
//  ViewController.swift
//  wheatherApp
//
//  Created by admin on 6/22/22.
//

import UIKit

class ViewController: UIViewController {

    var weatherItem = [list]()
    var weatherItemSearched = [list]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    public let weatherCellIdentifier = "WeatherCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
                
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        
        collectionView.register(UINib(nibName:"WeatherCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: weatherCellIdentifier)        
        
    }
    
    /*
    func loadData(URL url:String, completion: @escaping ([Weather]) -> Void) {
                
                let url = URL(string: url)
                let session = URLSession.shared
                
                let dataTask = session.dataTask(with: url!) { weatherItem, response, error in
                    if weatherItem != nil && error == nil {
                        do {
                        let parsingData = try JSONDecoder().decode([Weather].self, from: weatherItem!)
                            completion(parsingData)
                        }catch {
                            print ("Parsing error")
                        }
                    }
                }
                dataTask.resume()
    }*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func getWeatherData(withText: String){
            guard let url = URL(string:UrlManager.instance.urlWeather(text: withText)) else { return }
            
            NetworkManager.shared.get(WeatherList.self, from: url) { result in
                switch result {
                    case .success(let data):
                    self.weatherItemSearched = data.list
                        self.collectionView.reloadData()
                    
                    case .failure(let error):
                        print(error)
                        print("Here")
                    
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                                 alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                                 print("OK")
                             }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherItemSearched.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as? WeatherCollectionViewCell else {return UICollectionViewCell()}
        
        let list = weatherItemSearched[indexPath.row]
        let weather = weatherItemSearched[indexPath.row].weather[0]
        let temp = weatherItemSearched[indexPath.row].temp
        
        //cell.cityNameWeather.text = weatherItem[indexPath.row].name
        cell.cityNameWeather.text = list.name
        cell.descriptionWeather.text = weather.weatherDescription
        cell.temperatureWeather.text = "\(temp.temp) K"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let vc = WeatherDetailViewController()
        //vc.
    }
    
    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "GoToDetailFromCity", sender: nil)
        
        let destination = segue.destination as? DetailViewController else { return }
    }*/
    
        
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 1
        let height = collectionView.frame.width / 6
        return CGSize(width: width, height: height)
    }
}

