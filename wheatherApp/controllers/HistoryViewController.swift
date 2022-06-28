import UIKit
import CoreData
import Photos

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
       var history = [WeatherEntry]()
       var historyList: [List] = []
       var availableAssets: PHFetchResult<PHAsset>?
       
    public let historyIdentifier = "HistoryTableViewCell"
    
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
               history = history.sorted(by: { $0.date?.compare($1.date!) == .orderedDescending })
               tableView.reloadData()
           } catch(let err) {
               print("Error", err)
           }
       }
       
       func loadWeatherData(withText: String, withIndex: Int) {
           
           guard let url = URL(string:UrlManager.instance.urlWeather(text: withText)) else { return }
                   
                   NetworkManager.shared.get(WeatherList.self, from: url) { result in
                       switch result {
                           case .success(let data):
                               self.historyList = data.List
                               self.gotoDetail(withhistory: self.historyList[withIndex])
                           case .failure(let error):
                               print(error)
                           let alert = UIAlertController(title: "Error", message: "Something went wrong. Please, try again", preferredStyle: .alert)
                           
                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                                print("OK")
                                                        }))
                                self.present(alert, animated: true, completion: nil)
                       }
                   }
       }
       
       func gotoDetail(withhistory: List){
           let Detail = WeatherDetailViewController()
           
           Detail.weatherDetail = withhistory
           show(Detail, sender: nil)
       }
}
