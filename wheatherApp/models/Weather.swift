
import Foundation

struct Weather: Decodable{
    let name: String
    let temp: Main
    let description: WeatherDescription
    
    enum CodingKeys: String, CodingKey{
        case name
        case temp
        case description
    }
}

struct WeatherList: Decodable{
    let list: Weather
    
    enum CodingKeys: String, CodingKey{
        case list
    }
    
}

struct Main: Decodable{
    let temp: Int
    
    enum CodingKeys: String, CodingKey{
        case temp
    }
}

struct WeatherDescription: Decodable {
    let description: String
    
    enum CodingKeys: String, CodingKey{
        case description
    }
}
