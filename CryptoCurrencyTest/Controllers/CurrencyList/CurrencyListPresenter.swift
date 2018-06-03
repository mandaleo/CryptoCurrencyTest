//
//  CurrencyListPresenter.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class CurrencyListPresenter: InteractorObserverProtocol {
    
    //MARK: - Variables
    fileprivate weak var view: CurrencyListView!
    fileprivate weak var interactor: CurrencyListInteractor?
    
    
    //MARK: - Initialization and configuration
    init(container: CurrencyListView, interactor: CurrencyListInteractor?) {
        self.view = container
        self.interactor = interactor
        self.interactor?.delegate = self //TODO: - Make independent or use RxSwift
    }
    
    func buildViewModel() -> CurrencyListViewModel? {
        guard let listResults = interactor?.listResults else { return nil}

        var currencyItemsVM = [CurrencyViewModel]()
        for coin in listResults {
            let currencyVM = CurrencyViewModel(id: coin.id, name: coin.name, priceUSD: coin.price_usd, priceBTC: coin.price_btc, percentageLastHour: coin.percent_change_1h, percentageLastDay: coin.percent_change_24h, percentageLastWeek: coin.percent_change_7d)
            currencyItemsVM.append(currencyVM)
        }
        return CurrencyListViewModel(currentPage: 1, lastPage: 4, currencyList: currencyItemsVM)
        
    }
    
    //MARK: - InteractorObserverProtocol
    func interactorDidChange() {
        //let newViewModel = buildViewModel()
    }
}
