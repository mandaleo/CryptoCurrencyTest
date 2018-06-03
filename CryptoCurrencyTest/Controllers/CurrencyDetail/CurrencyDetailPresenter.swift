//
//  CurrencyDetailPresenter.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class CurrencyDetailPresenter {
    
    //MARK: - Variables
    weak var view: CurrencyDetailView!
    
    
    //MARK: - Initialization and configuration
    init(container: CurrencyDetailView, vm: CurrencyViewModel) {
        self.view = container
        self.view.presentViewModel(vm: vm)
    }
}

