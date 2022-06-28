import Foundation

struct WeatherList: Decodable {
    let message: String
    let cod: String
    let count : Int
    let List: [List]
    
    enum CodingKeys: String, CodingKey {
        case message
        case cod
        case count
        case List = "list"
    }
}

struct List: Decodable {
    let id: Int
    let name: String
    let coord : Coord
    let main: Main
    let dt: Int
    let wind: Wind?
    let sys: Sys
    let rain: Rain?
    let snow: Snow?
    let clouds: Clouds?
    let weather: [Weather]
}

struct Coord: Decodable {
    let lat: Double
    let lon: Double
}

struct Main: Decodable {
    let temp : Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level, grnd_level: Int?    
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

struct Sys: Decodable {
    let country: String
}

struct Rain: Decodable {
    let h1: Double?
    let h3: Double?
    
    enum CodingKeys: String, CodingKey {
        case h1 = "1h"
        case h3 = "3h"
    }
}

struct Snow: Decodable {
    let h1: Double?
    let h3: Double?
    
    enum CodingKeys: String, CodingKey {
        case h1 = "1h"
        case h3 = "3h"
    }
}

struct Clouds: Decodable {
    let all: Int
    
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
