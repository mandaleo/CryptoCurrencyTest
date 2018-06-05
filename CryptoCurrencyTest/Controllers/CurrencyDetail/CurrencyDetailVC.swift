//
//  CurrencyDetailVC.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit
import RealmSwift

class CurrencyDetailVC: UIViewController, CurrencyDetailViewDelegate {
    
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
        interactor = CurrencyDetailInteractor(withDatabase: realm, coinId: viewModel.id)
        presenter = CurrencyDetailPresenter(container: currencyDetailView, vm: viewModel, interactor: interactor!)
        presenter?.view.delegate = self
    }
    
    func setupTopBar(){
        self.title = viewModel.name
        let addTradeButton = UIBarButtonItem(title: "Add Trade", style: .plain, target: self, action: #selector(addTradeButtonTapped))
        self.navigationItem.rightBarButtonItem = addTradeButton
    }
    
    @objc func addTradeButtonTapped() {
        presenter?.view.toggleTradeContainerView(show: true)
    }
    
    //MARK: - CurrencyDetailViewDelegate
    func didMakeTrade(coindId: Int, amount: Double, priceUSD: Double, notes: String?) {
        interactor?.makeTrade(coindId: coindId, amount: amount, priceUSD: priceUSD, notes: notes, success: {
            print("call ok")
            self.presenter?.view.toggleTradeContainerView(show: false)
            self.makeTradeAlert(success: true)
        }, failure: { (err) in
            print(err)
            self.makeTradeAlert(success: false)
        })
    }
    
    func makeTradeAlert(success: Bool) {
        let title = "Add New Trade"
        let message = (success) ? "Transaction OK" : "Transaction Failure"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
