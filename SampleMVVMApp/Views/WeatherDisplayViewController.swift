//
//  ViewController.swift
//  SampleMVVMApp
//
//  Created by Mbah Fonong on 11/14/18.
//  Copyright © 2018 Mbah Fonong. All rights reserved.
//

import UIKit

class WeatherDisplayViewController: UIViewController {

    @IBOutlet weak var weatherTableView: UITableView!
    
    var weatherData: [WeatherDataModel] = []
    var viewModel: WeatherDataViewModel = WeatherDataViewModel(worker: WeatherDataWorker())
    //Try reloading tableview one row at a time
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.viewModel.getWeatherData()
        self.weatherTableView.dataSource = self
        self.weatherTableView.register(WeatherDataTableViewCell.nib, forCellReuseIdentifier: WeatherDataTableViewCell.nibName)
    }
}

extension WeatherDisplayViewController: WeatherDataViewModelDelegate {
    func didGatherWeatherData(weatherData: [WeatherDataModel]) {
        self.weatherData = weatherData
        self.weatherTableView.reloadData()
    }
}

extension WeatherDisplayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDataTableViewCell.nibName, for: indexPath) as? WeatherDataTableViewCell {
            if !self.weatherData.isEmpty {
                cell.configure(city: self.viewModel.cityIDs[indexPath.row].0, data: self.weatherData[indexPath.row])
            }
            return cell
        } else {
            return UITableViewCell(style: .default, reuseIdentifier: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cityIDs.count
    }
}
