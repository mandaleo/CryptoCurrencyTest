//
//  PortfolioInteractor.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 4/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import RealmSwift

class PortfolioInteractor {
    //MARK: - Variables
    var delegate: InteractorObserverProtocol?
    fileprivate var database: Realm!
    var listResults: Results<Trade>!
    
    //MARK: - Initialization and configuration
    init(withDatabase database: Realm) {
        self.database = database
        self.listResults = Trade.fetchTrades(realm: self.database)
        delegate?.interactorDidChange()
        retrieve()
    }
    
    fileprivate func retrieve() {
        _ = PortfolioListWorker(withDatabase: database, success: {
            self.listResults = Trade.fetchTrades(realm: self.database)
            self.delegate?.interactorDidChange()
        }, failure: { (err) in
            print(err)
        })
    }
}
