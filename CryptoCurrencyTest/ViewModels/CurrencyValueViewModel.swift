//
//  CurrencyValueViewModel.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 5/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

struct CurrencyValueViewModel {
    
    var priceUSD = ""
    var dateFormatted = ""
    
    init(priceUSD: String, date: String) {
        self.priceUSD = priceUSD
        let dateArray = date.split(separator: "T")
        let mothDays = dateArray[0].split(separator: "-").suffix(2).joined(separator: "-")
        let hourMinutes = dateArray[1].split(separator: ":").prefix(2).joined(separator: ":")
        self.dateFormatted = mothDays + " " + hourMinutes
    }
}
