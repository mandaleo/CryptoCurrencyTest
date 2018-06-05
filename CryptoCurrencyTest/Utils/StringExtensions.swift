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
    
    func isoStringToDateString() -> String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withYear, .withMonth, .withDay, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
        guard let date = dateFormatter.date(from: self) else {
            return "Unknown"
        }
        return "\(String(describing: date))"
    }
}
