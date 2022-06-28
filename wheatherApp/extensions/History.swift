import Foundation
import UIKit

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{
           
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return history.count 
       }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell") as? HistoryTableViewCell ?? HistoryTableViewCell()
                            
            let historialRecord = history[indexPath.row]
            cell.countrynameLabel.text = historialRecord.name
            
            if let datefor = historialRecord.date {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "d MMM yyyy"
                let newdate = dateFormatter.string(from: datefor)
                cell.dateLabel.text = newdate
            }
            
                return cell
            }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let history = history[indexPath.row]
            
            
            guard let name = history.name else { return }
            let index = Int(history.positionList)
            loadWeatherData(withText: name, withIndex: index)
        }   
    
}
