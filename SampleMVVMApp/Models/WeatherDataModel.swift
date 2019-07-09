//
//  WeatherDataModel.swift
//  SampleMVVMApp
//
//  Created by Mbah Fonong on 11/15/18.
//  Copyright © 2018 Mbah Fonong. All rights reserved.
//

import Foundation

struct WeatherDataModel: Decodable {
    var the_temp: Double
    var weather_state_abbr: String
    var humidity: Double?
}
