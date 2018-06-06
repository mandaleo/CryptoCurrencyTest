//
//  StringExtension.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

extension String {
    
    func parseIntoDoubleWithTwoDecimals() -> Double{
        let doubleString = Double(self) ?? 0.0
        return doubleString.rounded(toPlaces: 2)
    }
}
