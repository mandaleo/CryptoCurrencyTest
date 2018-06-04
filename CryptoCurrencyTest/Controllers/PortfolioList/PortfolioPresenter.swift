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
    
    func buildTradesListViewModel() -> TradesListViewModel? {
        guard let trades = interactor?.listResults else {return nil}
        var tradeArrayVM = [TradeViewModel]()
        for trade in trades {
            let tVM = buildTradeViewModel(id: trade.id, amount: trade.amount, priceUSD: trade.priceUSD, coinName: trade.coin?.name ?? "Unknow")
            tradeArrayVM.append(tVM)
        }
        return TradesListViewModel(tradesList: tradeArrayVM)
    }
    
    func buildTradeViewModel(id: Int, amount: String, priceUSD: String, coinName: String) -> TradeViewModel {
        return TradeViewModel(id: id, amount: amount, priceUSD: priceUSD, coinName: coinName)
    }
    
    //MARK: - InteractorObserverProtocol
    func interactorDidChange() {
        guard let newViewModel = buildTradesListViewModel() else {return}
        self.view.presentViewModel(vm: newViewModel)
    }
}
