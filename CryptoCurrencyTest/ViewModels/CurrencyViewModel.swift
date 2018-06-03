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
    var symbol = ""
    var rank = 0
    var priceUSD = 0.0
    var priceBTC = 0.0
    var volumeUSD = 0.0
    var marketCapUSD = 0.0
    var availableSupply = 0.0
    var totalSupply = 0.0
    var percentageLastHour = 0.0
    var percentageLastDay = 0.0
    var percentageLastWeek = 0.0
    var createdISO = ""
    var updatedISO = ""
    
    init(id: Int, name: String, symbol: String, rank: Int, priceUSD: String, priceBTC: String, volumeUSD: Double, marketCapUSD: Double, availableSupply: Double, totalSupply: Double, percentageLastHour: String, percentageLastDay: String, percentageLastWeek: String, createdISO: String, updatedISO: String) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.rank = rank
        self.priceUSD = priceUSD.parseIntoDoubleWithTwoDecimals()
        self.priceBTC = priceBTC.parseIntoDoubleWithTwoDecimals()
        self.volumeUSD = volumeUSD.rounded(toPlaces: 2)
        self.marketCapUSD = marketCapUSD.rounded(toPlaces: 2)
        self.availableSupply = availableSupply.rounded(toPlaces: 2)
        self.totalSupply = totalSupply.rounded(toPlaces: 2)
        self.percentageLastHour = percentageLastHour.parseIntoDoubleWithTwoDecimals()
        self.percentageLastDay = percentageLastDay.parseIntoDoubleWithTwoDecimals()
        self.percentageLastWeek = percentageLastWeek.parseIntoDoubleWithTwoDecimals()
        self.createdISO = createdISO
        self.updatedISO = updatedISO
    }
    
    func isEquals(other: CurrencyViewModel) -> Bool {
        return self.id == other.id
    }
}
