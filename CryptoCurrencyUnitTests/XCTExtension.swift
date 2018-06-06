//
//  XCTExtension.swift
//  CryptoCurrencyUnitTests
//
//  Created by Manuel Martinez Gomez on 6/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import XCTest
import Foundation

@testable import CryptoCurrencyTest

extension XCTest {
    
    func fakeCurrencyVM() ->  CurrencyViewModel{
        return CurrencyViewModel(id: 2, name: "Ethereum", symbol: "ETH", rank: 2, priceUSD: "719.98600000", priceBTC: "0.07797240", volumeUSD: 3014730000, marketCapUSD: 71421998446, availableSupply: 99199149, totalSupply: 99199149, percentageLastHour: "0.28000000", percentageLastDay: "5.52000000", percentageLastWeek: "14.58000000", createdISO: "2018-05-03T08:54:02+00:00", updatedISO: "2018-05-03T08:54:02+00:00")
        
    }
}
