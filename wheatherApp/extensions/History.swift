import Foundation
import UIKit

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{
           
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return history.count 
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell") as? HistoryTableViewCell ?? HistoryTableViewCell()
            
            let historyData = history[indexPath.row]
            cell.countrynameLabel.text = historyData.name
            
            
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let history = history[indexPath.row]
            
            
            guard let name = history.name else { return }
            let index = Int(history.positionList)
            getWeatherData(withText: name, withIndex: index)
        }   
    
}
