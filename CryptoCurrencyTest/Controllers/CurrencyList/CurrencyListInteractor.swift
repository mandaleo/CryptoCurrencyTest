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
    
    //MARK: - Initialization and configuration
    init(withDatabase database: Realm) {
        self.database = database
        _ = ListCoinsWorker(withPage: 1){ (coins: [Coin]) in 
            self.delegate?.interactorDidChange()
        }
    }
}
