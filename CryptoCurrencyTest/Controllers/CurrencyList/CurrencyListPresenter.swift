//
//  CurrencyListPresenter.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class CurrencyListPresenter {
    
    fileprivate weak var view: CurrencyListView!
    
    init(container: CurrencyListView) {
        self.view = container
    }
}
