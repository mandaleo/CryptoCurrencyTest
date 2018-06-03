//
//  CurrencyListInteractor.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import RealmSwift

class CurrencyListInteractor {
    
    //MARK: - Variables
    var delegate: InteractorObserverProtocol?
    fileprivate var database: Realm!
    var listResults: Results<Coin>!
    
    //MARK: - Initialization and configuration
    init(withDatabase database: Realm) {
        self.database = database
        listResults = Coin.fetchCoins(realm: database)
        if (listResults != nil) && listResults.count > 0 {
            delegate?.interactorDidChange()
        }else {
            moreCoins()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(moreCoins), name: Notification.Name("loadMoreData"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func moreCoins(){
        let nextPage = UserDefaults.standard.getNextPage()
        let finalPage = UserDefaults.standard.getFinalPage()
        if nextPage <= finalPage || finalPage == 0 {
            _ = ListCoinsWorker(withDatabase: database, page: nextPage){
                self.listResults = Coin.fetchCoins(realm: self.database)
                self.delegate?.interactorDidChange()
            }
        }
    }
}
