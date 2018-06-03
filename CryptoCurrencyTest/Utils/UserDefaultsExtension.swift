//
//  UserDefaultsExtension.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func getFinalPage() -> Int {
        return UserDefaults.standard.integer(forKey: "finalPage")
    }
    
    func saveFinalPage(finalPage: Int) {
        if finalPage != getFinalPage() {
            UserDefaults.standard.set(finalPage, forKey: "finalPage")
        }
    }
    
    func getCurrentPage() -> Int {
        return UserDefaults.standard.integer(forKey: "getNextPage")
    }
    
    func getNextPage() -> Int {
        let nextPage = UserDefaults.standard.integer(forKey: "getNextPage") + 1
        UserDefaults.standard.set(nextPage, forKey: "getNextPage")
        return nextPage
    }
}

