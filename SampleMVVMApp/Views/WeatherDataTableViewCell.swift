//
//  WeatherDataTableViewCell.swift
//  SampleMVVMApp
//
//  Created by Mbah Fonong on 11/15/18.
//  Copyright © 2018 Mbah Fonong. All rights reserved.
//

import Kingfisher
import UIKit

class WeatherDataTableViewCell: UITableViewCell {

    static let nibName = "WeatherDataTableViewCell"
    static let nib = UINib(nibName: nibName, bundle: nil)
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var humidityTitleLabel: UILabel!
    
    func configure(city: String, data: WeatherDataModel) {
        self.humidityTitleLabel.text = "Humidity"
        self.cityLabel.text = city
        self.degreeLabel.text = "\(Int(data.the_temp))°C"
        self.humidityLabel.text = "\(data.humidity ?? 0)%"
        let iconURL: URL? = URL(string: URLS.weatherIcon.replacingOccurrences(of: "X", with: data.weather_state_abbr))
        
        self.iconImageView?.kf.setImage(with: iconURL, placeholder: UIImage(named: "default_img"), options: nil, progressBlock: nil, completionHandler: nil)
    }
    
}
