//
//  CurrencyViewModel.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

struct CurrencyViewModel {
    var id = 0
    var name = ""
    var priceUSD = ""
    var priceBTC = ""
    var percentageLastHour = ""
    var percentageLastDay = ""
    var percentageLastWeek = ""
    
    init(id: Int, name: String, priceUSD: String, priceBTC: String, percentageLastHour: String, percentageLastDay: String, percentageLastWeek: String) {
        self.id = id
        self.name = name
        self.priceUSD = priceUSD
        self.priceBTC = priceBTC
        self.percentageLastHour = percentageLastHour
        self.percentageLastDay = percentageLastDay
        self.percentageLastWeek = percentageLastWeek
    }
    
    func isEquals(other: CurrencyViewModel) -> Bool {
        return self.id == other.id
    }
}
