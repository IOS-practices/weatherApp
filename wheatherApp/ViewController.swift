//
//  ViewController.swift
//  wheatherApp
//
//  Created by admin on 6/22/22.
//

import UIKit

class ViewController: UIViewController {

    var weatherItem = [Weather]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    public let weatherCellIdentifier = "WeatherCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        //searchBar.dataSource = self
        //searchbbbbbdBar.delegate = self
        
       /*let uiNib = UINib(nibName: "WeatherCollectionViewCell", bundle: nil)
        collectionView.register(uiNib, forCellWithReuseIdentifier:  weatherCellIdentifier)*/
        
        collectionView.register(UINib(nibName:"WeatherCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: weatherCellIdentifier)
        
        loadData(URL: "https://openweathermap.org/data/2.5/find?appid=439d4b804bc8187953eb36d2a8c26a02&q=oruro") { result in
                   self.weatherItem = result
                   DispatchQueue.main.async {
                       self.collectionView.reloadData()
                   }
        }
    }
    
    func loadData(URL url:String, completion: @escaping ([Weather]) -> Void) {
                
                let url = URL(string: url)
                let session = URLSession.shared
                
                let dataTask = session.dataTask(with: url!) { weatherItem, response, error in
                    if weatherItem != nil && error == nil{
                        do {
                        let parsingData = try JSONDecoder().decode([Weather].self, from: weatherItem!)
                            completion(parsingData)
                        }catch {
                            print ("Parsing error")
                        }
                    }
                }
                dataTask.resume()
            }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as? WeatherCollectionViewCell else {return UICollectionViewCell()}
        
        //cell.cityNameWeather.text = weatherItem[indexPath.row].name
        cell.cityNameWeather.text = "Oruro"
        cell.descriptionWeather.text = "Clear Sky"
        cell.temperatureWeather.text = "12 C"
        
        return cell
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

