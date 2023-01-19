//
//  NetworkHelper.swift
//  WeatherApp
//
//  Created by batuhan on 17.01.2023.
//

import Foundation

final class NetworkHelper{
    static let shared = NetworkHelper()
    
    private let BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
    private let API_KEY = "c09647eb32efbc0e65b4d86cbdee2d21"
    
    func returnURL(longitude:Double,latitude:Double)->String{
        let url = "\(BASE_URL)lat=\(latitude)&lon=\(longitude)&appid=\(API_KEY)&units=metric"
        return url
    }
}

enum HTTPMethod :String{
    case POST
    case GET
    case DELETE
    case UPDATE
}

enum ErrorType:String, Error{
    case invalidData
}
