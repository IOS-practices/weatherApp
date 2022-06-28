import Foundation
import UIKit
//import SVProgressHUD

extension ViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
     func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         //SVProgressHUD.show()
        guard let text = searchBar.text, !text.isEmpty else {
            print("empty")
            return            
        }
        
         //SVProgressHUD.dismiss()
        loadWeatherData(withText: text)
         self.collectionView.reloadData()
    }
    
    func controllerView(_ controllerView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let Detail = WeatherDetailViewController()
            let list = weatherItemSearched[indexPath.row]
            Detail.weatherDetail = list
            
            saveHistory(withIndex: indexPath.row, withName: list.name)
            show(Detail, sender: nil)
        }
    
    
}

