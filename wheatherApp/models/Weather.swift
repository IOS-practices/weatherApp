
import Foundation


// MARK: - Main
struct WeatherList: Decodable{
    let count: Int
    let list: [list]
    
    enum CodingKeys: String, CodingKey{
        case count
        case list
    }
}

// MARK: - List
struct list: Decodable{
    let id: Int
    let name: String
    let temp: Main
    let sys: Sys
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case temp
        case sys
        case weather
    }
}

// MARK: - Main
struct Main: Decodable{
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    
    enum CodingKeys: String, CodingKey{
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Decodable{
    let country: String
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
