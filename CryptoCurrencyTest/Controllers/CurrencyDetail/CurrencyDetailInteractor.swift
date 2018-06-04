//
//  CurrencyDetailInteractor.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import RealmSwift

class CurrencyDetailInteractor {
    
    //MARK: - Variables
    fileprivate var database: Realm!
    
    //MARK: - Initialization and configuration
    init(withDatabase database: Realm) {
        self.database = database
    }
    
    func makeTrade(coindId: Int, amount: Double, priceUSD: Double, notes: String?, completion: @escaping () -> ()) {
        _ = NewTradeWorker(coindId: coindId, amount: amount, priceUSD: priceUSD, notes: notes) {
            completion()
        }
    }
}
