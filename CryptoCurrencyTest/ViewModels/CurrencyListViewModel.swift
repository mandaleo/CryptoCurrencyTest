//
//  CurrencyListViewModel.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

struct CurrencyListViewModel {
    var currentPage = 0
    var lastPage = 0
    var currencyList = [CurrencyViewModel]()
    
    init(currentPage: Int, lastPage: Int, currencyList: [CurrencyViewModel]) {
        self.currentPage = currentPage
        self.lastPage = lastPage
        self.currencyList = currencyList
    }
    
    func isEquals(other: CurrencyListViewModel) -> Bool {
        return self.currentPage == other.currentPage && self.currencyList.first?.id == other.currencyList.first?.id && self.currencyList.last?.id == other.currencyList.last?.id
    }
}


