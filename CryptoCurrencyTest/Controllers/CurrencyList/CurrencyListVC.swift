//
//  CurrencyListVC.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit
import RealmSwift

class CurrencyListVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var currencyListview: CurrencyListView!
    
    //MARK: - Variables
    var realm: Realm!
    var presenter:  CurrencyListPresenter?
    var interactor: CurrencyListInteractor?
    
    //MARK: - Initialization and configuration
    func configure(withDatabase dataBase: Realm) {
        realm = dataBase
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIP()
    }
    
    
    /// Default method to init VIP cycle
    func setupVIP() {
        interactor = CurrencyListInteractor(withDatabase: realm)
        presenter = CurrencyListPresenter(container: currencyListview, interactor: interactor)
    }
}
