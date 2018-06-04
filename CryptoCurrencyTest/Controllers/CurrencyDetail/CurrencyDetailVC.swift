//
//  CurrencyDetailVC.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit
import RealmSwift

class CurrencyDetailVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var currencyDetailView: CurrencyDetailView!
    
    //MARK: - Variables
    var realm: Realm!
    var presenter:  CurrencyDetailPresenter?
    var interactor: CurrencyDetailInteractor?
    var viewModel: CurrencyViewModel!
    
    //MARK: - Initialization and configuration
    func configure(withDatabase dataBase: Realm, vm: CurrencyViewModel) {
        realm = dataBase
        viewModel = vm
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIP()
        setupTopBar()
    }
    
    /// Default method to init VIP cycle
    func setupVIP() {
        interactor = CurrencyDetailInteractor(withDatabase: realm)
        presenter = CurrencyDetailPresenter(container: currencyDetailView, vm: viewModel)
    }
    
    func setupTopBar(){
        self.title = viewModel.name
        let addTradeButton = UIBarButtonItem(title: "Add Trade", style: .plain, target: self, action: #selector(addTradeButtonTapped))
        self.navigationItem.rightBarButtonItem = addTradeButton
    }
    
    @objc func addTradeButtonTapped() {
        presenter?.view.toggleTradeContainerView(show: true)
    }
}
