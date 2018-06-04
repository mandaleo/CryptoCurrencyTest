//
//  TradeViewModel.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 4/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

struct TradeViewModel {
    
    var id = 0
    var amount = 0.0
    var priceUSD = 0.0
    var coinName = ""
    
    init(id: Int, amount: String, priceUSD: String, coinName: String) {
        self.id = id
        self.amount = amount.parseIntoDoubleWithTwoDecimals()
        self.priceUSD = priceUSD.parseIntoDoubleWithTwoDecimals()
        self.coinName = coinName
    }
}
