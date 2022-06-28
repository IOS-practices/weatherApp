import UIKit
import CoreData
import Photos

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
       var history = [WeatherEntry]()
       var historyList: [List] = []
       var availableAssets: PHFetchResult<PHAsset>?
       
    public let historyIdentifier = "HistoryCell"
    
       override func viewDidLoad() {
           super.viewDidLoad()
           
           tableView.delegate = self
           tableView.dataSource = self
           
           let uiNib = UINib(nibName: "HistoryTableViewCell", bundle: nil)
           tableView.register(uiNib, forCellReuseIdentifier: historyIdentifier)
       }
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           loadHistoryData()
       }
       
       func loadHistoryData() {
           
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
           let context = appDelegate.persistentContainer.viewContext
           
           let fetchRequest: NSFetchRequest<WeatherEntry>
           fetchRequest = WeatherEntry.fetchRequest()

           do {
               history = try context.fetch(fetchRequest)
               tableView.reloadData()
           } catch(let err) {
               print("Error", err)
           }
       }
       
       func getWeatherData(withText: String, withIndex: Int) {
           
           guard let url = URL(string:UrlManager.instance.urlWeather(text: withText)) else { return }
                   
                   NetworkManager.shared.get(WeatherList.self, from: url) { result in
                       switch result {
                           case .success(let data):
                               self.historyList = data.List
                               self.gotoDetail(withhistory: self.historyList[withIndex])
                           case .failure(let error):
                               print(error)
                       }
                   }
       }
       
       func gotoDetail(withhistory: List){
           let Detail = WeatherDetailViewController()
           
           Detail.weatherDetail = withhistory
           show(Detail, sender: nil)
       }
}
