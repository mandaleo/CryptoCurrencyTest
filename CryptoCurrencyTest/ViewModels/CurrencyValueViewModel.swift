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
        self.dateFormatted = date.isoStringToDateString()
    }
}
