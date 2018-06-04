//
//  DateExtension.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 4/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

extension Date {
    
    func toIso8601()-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.string(from: self)
    }
}
