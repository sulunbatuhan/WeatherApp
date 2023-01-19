//
//  WeatherMiniModel.swift
//  WeatherApp
//
//  Created by batuhan on 18.01.2023.
//

import Foundation

struct WeatherMiniModel {
    let id : Int
    let city : String
    let temperature : Double
    
    var imageId : String {
        switch id{
        case 200...232:
            return "cloud.bolt"
        case 300...321 :
            return "cloud.drizzle"
        case 500...531 :
            return "cloud.rain"
        case 600...622 :
            return "cloud.snow"
        case 701...781 :
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804 :
            return "cold.bolt"
        default :
            return "cloud"
        }
    }
    
}
