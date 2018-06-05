//
//  GetChartData.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 5/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

protocol GetChartData {
    var datePrice: [String] {get set}
    var amountPrice: [String] {get set}
}
