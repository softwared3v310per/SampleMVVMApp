//
//  WeatherDataViewModel.swift
//  SampleMVVMApp
//
//  Created by Mbah Fonong on 11/15/18.
//  Copyright © 2018 Mbah Fonong. All rights reserved.
//

import Foundation
protocol WeatherDataViewModelDelegate: class {
    func didGatherWeatherData(weatherData: [WeatherDataModel])
}

class WeatherDataViewModel {
    let worker: WeatherDataWorkerInterface
    weak var delegate: WeatherDataViewModelDelegate?
    
    let cityIDs: [(String, String)] = [("Gothenburg","890869"),("Stockholm","906057"),("Mountain View","2455920"),("London","44418"),("New York","2459115"),("Berlin","638242")]
    
    var weatherData: [WeatherDataModel] = []
    
    init(worker: WeatherDataWorkerInterface) {
        self.worker = worker
    }
    
    func getWeatherData() {
        let date = Date()
        let todaysDate = DateFormatters.yearMonthDay.string(from: date)
        for id in self.cityIDs {
            self.getWeatherData(searchString: "\(URLS.weatherData)\(id.1)/\(todaysDate)")
        }
    }
    
    private func getWeatherData(searchString: String) {
        guard let url = URL(string: searchString) else { return }
        self.worker.getWeatherData(url: url) { (data, error) in
            DispatchQueue.main.async {
                if let data = data {
                    if let weatherDataItem = self.worker.getJSONFromWeatherData(data: data) {
                        self.weatherData.append(weatherDataItem)
                    }
                }
                if self.weatherData.count == self.cityIDs.count {
                    self.delegate?.didGatherWeatherData(weatherData: self.weatherData)
                }
            }
        }
    }
}
