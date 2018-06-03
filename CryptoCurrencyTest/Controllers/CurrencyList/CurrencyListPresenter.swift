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
    
    
    //MARK: - Initialization and configuration
    init(container: CurrencyListView, interactor: CurrencyListInteractor?) {
        self.view = container
        interactor?.delegate = self //TODO: - Make independent or use RxSwift
    }
    
    //MARK: - InteractorObserverProtocol
    func interactorDidChange() {
        print("interactor change")
    }
}
