//
//  TradesListViewModel.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 5/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

struct TradesListViewModel {
    var totalPriceUSD = 0.0
    var tradesList = [TradeViewModel]()
    
    init(tradesList: [TradeViewModel]) {
        self.tradesList = tradesList
        for trade in tradesList {
            self.totalPriceUSD += trade.priceUSD
        }
    }
}
