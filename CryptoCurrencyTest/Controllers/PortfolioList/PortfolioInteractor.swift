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
    //var listResults: Results<Coin>!
    
    //MARK: - Initialization and configuration
    init(withDatabase database: Realm) {
        self.database = database
        retrieve()
        /*
        listResults = Coin.fetchCoins(realm: database)
        if (listResults != nil) && listResults.count > 0 {
            delegate?.interactorDidChange()
        }else {
            moreCoins()
        }
         */
    }
    
    fileprivate func retrieve() {
        _ = PortfolioListWorker(withDatabase: database, success: {
            //self.listResults = Coin.fetchCoins(realm: self.database)
            self.delegate?.interactorDidChange()
        }, failure: { (err) in
            print(err)
        })
    }
}
