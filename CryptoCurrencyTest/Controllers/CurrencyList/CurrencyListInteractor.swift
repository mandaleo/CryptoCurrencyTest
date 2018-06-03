//
//  CurrencyListInteractor.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

class CurrencyListInteractor {
    
    var delegate: InteractorObserverProtocol?
    
    //MARK: - Initialization and configuration
    init() {
        _ = ListCoinsWorker(withPage: 1){
            self.delegate?.interactorDidChange()
        }
    }
}
