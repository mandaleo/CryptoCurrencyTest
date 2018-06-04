//
//  PortfolioPresenter.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 4/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class PortfolioPresenter: InteractorObserverProtocol {
    
    //MARK: - Variables
    weak var view: PortfolioView!
    fileprivate weak var interactor: PortfolioInteractor?
    
    
    //MARK: - Initialization and configuration
    init(container: PortfolioView, interactor: PortfolioInteractor?) {
        self.view = container
        self.interactor = interactor
        self.interactor?.delegate = self //TODO: - Make independent or use RxSwift
    }
    
    /*
    func buildViewModel() -> CurrencyListViewModel? {
        guard let listResults = interactor?.listResults else { return nil}
        
        var currencyItemsVM = [CurrencyViewModel]()
        for coin in listResults {
            let currencyVM = CurrencyViewModel(id: coin.id, name: coin.name, symbol: coin.symbol, rank: coin.rank, priceUSD: coin.price_usd, priceBTC: coin.price_btc, volumeUSD: coin.volume_usd, marketCapUSD: coin.market_cap_usd, availableSupply: coin.available_supply, totalSupply: coin.total_supply, percentageLastHour: coin.percent_change_1h, percentageLastDay: coin.percent_change_24h, percentageLastWeek: coin.percent_change_7d, createdISO: coin.created_at, updatedISO: coin.updated_at)
            currencyItemsVM.append(currencyVM)
        }
        return CurrencyListViewModel(currentPage: 1, lastPage: 4, currencyList: currencyItemsVM)
        
    }*/
    
    //MARK: - InteractorObserverProtocol
    func interactorDidChange() {
        //guard let newViewModel = buildViewModel() else {return}
        //self.view.presentViewModel(vm: newViewModel)
    }
}
