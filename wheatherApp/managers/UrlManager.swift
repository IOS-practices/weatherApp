import Foundation

class UrlManager {
    static let instance = UrlManager()
    
    func urlWeather(text: String) -> String {
        let urlStr = "https://openweathermap.org/data/2.5/find?q=\(text)appid=439d4b804bc8187953eb36d2a8c26a02&units=metric"
        return urlStr
    }
    
}

