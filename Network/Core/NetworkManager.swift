//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by batuhan on 17.01.2023.
//

import Foundation
import UIKit
 

protocol NetworkManagerProtocol{
    func request<T:Codable>(type:T.Type,url:String,method:HTTPMethod,completion:@escaping(Result<T,ErrorType>)->())
}

final class NetworkManager : NetworkManagerProtocol {
    static let shared = NetworkManager()
    
   func request<T:Codable>(type:T.Type,url:String,method:HTTPMethod,completion:@escaping(Result<T,ErrorType>)->()){
        var urlRequest = URLRequest(url:URL(string: url)!)
        urlRequest.httpMethod = method.rawValue
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data , response , error in
            if error != nil || data == nil {
                completion(.failure(.invalidData))
            }
            if let data = data {
                do{
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                }catch{
                    completion(.failure(.invalidData))
                }
            }
        }
       dataTask.resume()
    }
}

