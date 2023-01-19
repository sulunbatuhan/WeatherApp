//
//  ViewController.swift
//  WeatherApp
//
//  Created by batuhan on 17.01.2023.
//

import UIKit
import CoreLocation

protocol ViewControllerProtocol:AnyObject{
    func locationManagerSettings()
    func setView(model : WeatherMiniModel)
    func viewDesign()
}

class ViewController: UIViewController {
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherCelcius: UILabel!
    @IBOutlet weak var weatherCityName: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    private lazy var viewModel = MainViewModel()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "light")
        viewModel.view = self
        viewModel.didload()
    }
    
    @IBAction func locationButtonPressed(_ sender: UIBarButtonItem) {
        locationManager.requestLocation()
        
    }
    
}




//MARK: - CLLocationManager

extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            let lon = location.coordinate.longitude
            let lat = location.coordinate.latitude
            viewModel.getCoord(latitude: lat, longitude:lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}


extension ViewController : ViewControllerProtocol{
    func setView(model : WeatherMiniModel) {
        DispatchQueue.main.async {
            self.weatherCityName.text = model.city
            self.weatherCelcius.text = String(model.temperature)
            self.weatherImage.image = UIImage(systemName: model.imageId)
            print(model.imageId)
        }
    }
    
    func locationManagerSettings() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    func viewDesign(){
        let design = UINavigationBarAppearance()
        design.backgroundColor = UIColor(named: "Color")
        navigationController?.navigationBar.scrollEdgeAppearance = design
        navigationController?.navigationBar.compactAppearance = design
        navigationController?.navigationBar.standardAppearance = design
    }
}
