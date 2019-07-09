//
//  WeatherDataWorker.swift
//  SampleMVVMApp
//
//  Created by Mbah Fonong on 11/15/18.
//  Copyright © 2018 Mbah Fonong. All rights reserved.
//

import Foundation

protocol WeatherDataWorkerInterface {
    func getWeatherData(url: URL, completion: @escaping (Data?, Error?) -> ())
    func getJSONFromWeatherData(data: Data) -> WeatherDataModel?
}

class WeatherDataWorker: WeatherDataWorkerInterface {
    func getWeatherData(url: URL, completion: @escaping (Data?, Error?) -> ()){
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let _ = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                completion(data, nil)
            } else {
                completion(nil, error)
            }
        }.resume()
    }
    
    func getJSONFromWeatherData(data: Data) -> WeatherDataModel? {
        do {
        let weatherDataArray = try JSONDecoder().decode([WeatherDataModel].self, from: data)
        return weatherDataArray.first
        } catch let error {
            print("Error in decoding: \(error)")
            return nil
        }
    }
}
