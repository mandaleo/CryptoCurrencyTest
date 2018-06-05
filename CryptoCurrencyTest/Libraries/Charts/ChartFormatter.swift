//
//  LineChartFormatter.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 5/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit
import Charts

class ChartFormatter: IAxisValueFormatter {
    
    var dates = [String]()
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return dates[Int(value)]
    }
    
    func setValues(values: [String]) {
        dates = values
    }
}
