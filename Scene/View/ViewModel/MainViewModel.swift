//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by batuhan on 17.01.2023.
//

import Foundation

protocol MainModelProtocol{
    var view : ViewControllerProtocol?{get set}
    var weatherManager : WeatherManagerProtocol{get}
    func didload()
}

final class MainViewModel{
    weak var view: ViewControllerProtocol?
    var weatherData : WeatherModel?
    
    var weatherManager: WeatherManagerProtocol
    init() {
        weatherManager = WeatherManager()
    }
    
    func getCoord(latitude:Double,longitude:Double){
        let url = NetworkHelper.shared.returnURL(longitude: longitude, latitude: latitude)
        weatherManager.fetchWeatherData(url: url) { [weak self] weather , error in
            if let weather = weather{
                let model = WeatherMiniModel(id: weather.weather[0].id, city: weather.name, temperature: weather.main.temp)
                self!.view?.setView(model: model)
            }
        }
    }
}
extension MainViewModel : MainModelProtocol{
    func didload(){
        view?.locationManagerSettings()
        view?.viewDesign()
    }
}




