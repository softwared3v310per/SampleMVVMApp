//
//  Formatters.swift
//  SampleMVVMApp
//
//  Created by Mbah Fonong on 11/16/18.
//  Copyright © 2018 Mbah Fonong. All rights reserved.
//

import Foundation

struct DateFormatters {
    static var yearMonthDay: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }
}
