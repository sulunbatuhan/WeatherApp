//
//  MockNetwork.swift
//  WeatherApp
//
//  Created by batuhan on 17.01.2023.
//

import Foundation


class MockNetwork {
    static let shared = MockNetwork()
    
    func fetchWeather(){
        let url = URL(string: (NetworkHelper.shared.returnURL(longitude: 28, latitude: 41)))
        
        let urlRequest = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                print(error)
                return
            }
            if let safeData = data {
                let dataString = String(data: safeData, encoding: .utf8)
                do {
                    let decode = try JSONDecoder().decode(WeatherModel.self, from: safeData)
                    print(decode.name)
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
}
