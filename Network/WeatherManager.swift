//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by batuhan on 17.01.2023.
//

import Foundation


protocol WeatherManagerProtocol{
    func fetchWeatherData(url:String,completion:@escaping(WeatherModel?,String?)->())
}

class WeatherManager : WeatherManagerProtocol{
    static let shared = WeatherManager()
    
    func fetchWeatherData(url:String,completion:@escaping(WeatherModel?,String?)->()){
        NetworkManager.shared.request(type: WeatherModel.self, url: url, method: .GET) { response in
            switch response {
            case .success(let success):
                completion(success,nil)
            case .failure(_):
                completion(nil,nil)
            }
        }
    }
    
}
