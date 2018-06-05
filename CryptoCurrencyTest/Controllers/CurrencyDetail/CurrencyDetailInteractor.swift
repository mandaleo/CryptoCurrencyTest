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
    var delegate: InteractorObserverProtocol?
    var listResults: Results<CurrencyValue>!
    fileprivate var coinId = 0
    
    //MARK: - Initialization and configuration
    init(withDatabase database: Realm, coinId: Int) {
        self.database = database
        self.coinId = coinId
        self.listResults = CurrencyValue.fetchCurrencyValues(withCoinId: self.coinId, realm: self.database)
        delegate?.interactorDidChange()
        retrieveHistorical()
    }
    
    func makeTrade(coindId: Int, amount: Double, priceUSD: Double, notes: String?, success: @escaping () -> (), failure:@escaping (Error)-> ()) {
        _ = NewTradeWorker(coindId: coindId, amount: amount, priceUSD: priceUSD, notes: notes, success: {
            success()
        }) { (err) in
            failure(err)
        }
    }
    
    fileprivate func retrieveHistorical() {
        _ = HistoricalListWorker(withDatabase: database, coinId: coinId, success: {
            self.listResults = CurrencyValue.fetchCurrencyValues(withCoinId: self.coinId, realm: self.database)
            self.delegate?.interactorDidChange()
        }, failure: { (err) in
            print(err)
        })
    }
}
