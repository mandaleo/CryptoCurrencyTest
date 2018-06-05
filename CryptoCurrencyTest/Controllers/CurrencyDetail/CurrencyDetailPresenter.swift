//
//  CurrencyDetailPresenter.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class CurrencyDetailPresenter: InteractorObserverProtocol {
    
    //MARK: - Variables
    weak var view: CurrencyDetailView!
    fileprivate weak var interactor: CurrencyDetailInteractor?
    
    
    //MARK: - Initialization and configuration
    init(container: CurrencyDetailView, vm: CurrencyViewModel, interactor: CurrencyDetailInteractor) {
        self.view = container
        self.interactor = interactor
        self.interactor?.delegate = self
        self.view.presentViewModel(vm: vm)
    }
    
    func buildViewModel() -> [CurrencyValueViewModel] {
        var historicalVM = [CurrencyValueViewModel]()
        guard let historicalResult = interactor?.listResults else {
            return historicalVM
        }
        for currencyValue in historicalResult {
            let vm = CurrencyValueViewModel(priceUSD: currencyValue.priceUSD, date: currencyValue.date)
            historicalVM.append(vm)
        }
        return historicalVM
    }
    
    //MARK: - InteractorObserverProtocol
    func interactorDidChange() {
        let vm = buildViewModel()
        self.view.populateChartData(viewModel:vm)
    }
}

