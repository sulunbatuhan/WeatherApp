//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by batuhan on 17.01.2023.
//

import Foundation

// MARK: - WeatherModel
class WeatherModel : Codable {
    let coord : Coord
    let weather : [Weather]
    let base : String
    let main : Main
    let visibility : Int
    let wind : Wind
    let clouds : Clouds
    let dt : Double
    let sys : Sys
    let timezone : Int
    let id : Int
    let name : String
    let cod : Int
}

class Coord : Codable {
    internal init(lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
    }
    
    let lon : Double
    let lat : Double
    
}

class Weather : Codable {
    let id : Int
    let main : String
    let description : String
    let icon : String
   
    init(id: Int, main: String, description: String, icon: String) {
       self.id = id
       self.main = main
       self.description = description
       self.icon = icon
   }
    
}

class Main : Codable {
    internal init(temp: Double, feels_like: Double, temp_min: Double, temp_max: Double, pressure: Double, humidity: Double, sea_level: Int, grnd_level: Int) {
        self.temp = temp
        self.feels_like = feels_like
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.pressure = pressure
        self.humidity = humidity
        self.sea_level = sea_level
        self.grnd_level = grnd_level
    }
    
    let temp : Double
    let feels_like : Double
    let temp_min : Double
    let temp_max : Double
    let pressure : Double
    let humidity : Double
    let sea_level : Int?
    let grnd_level : Int?
    
    
}

class Wind : Codable {
    internal init(speed: Double, deg: Double, gust: Double) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
    
    let speed : Double
    let deg : Double
    let gust : Double?
    
}

class Clouds : Codable {
    let all : Int
}
class Sys : Codable {
    internal init(sunrise: Int, sunset: Int) {
       // self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
    
   // let country : String
    let sunrise : Int
    let sunset : Int
    
}



