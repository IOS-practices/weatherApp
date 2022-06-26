import Foundation
import UIKit

extension ViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
               
        weatherItemSearched = weatherItem.filter({
            $0.name.lowercased().prefix(searchText.count) == searchText.lowercased()
        })
            
        collectionView.reloadData()

         }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else { return }
        
        getWeatherData(withText: text)
        self.view.endEditing(true)
    }
    /*
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        weatherItemSearched.removeAll()
        //searchTableView.reloadData()
        self.view.endEditing(true)
    }*/
    
}

