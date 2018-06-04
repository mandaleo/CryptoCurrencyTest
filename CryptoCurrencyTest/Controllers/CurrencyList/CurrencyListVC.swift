//
//  CurrencyListVC.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit
import RealmSwift

class CurrencyListVC: UIViewController, CurrencyListDelegate {
    
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
        setupTopBar()
    }
    
    
    /// Default method to init VIP cycle
    func setupVIP() {
        interactor = CurrencyListInteractor(withDatabase: realm)
        presenter = CurrencyListPresenter(container: currencyListview, interactor: interactor)
        presenter?.interactorDidChange()
        presenter?.view.delegate = self
    }
    
    func setupTopBar(){
        self.title = "Currency List"
        let portfolioButton = UIBarButtonItem(title: "Portfolio", style: .plain, target: self, action: #selector(portfolioButtonTapped))
        self.navigationItem.rightBarButtonItem = portfolioButton
    }
    
    //MARK: - CurrencyListDelegate
    func didSelectRow(viewModel: CurrencyViewModel) {
        let detailCurrencyVC = CurrencyDetailVC()
        detailCurrencyVC.configure(withDatabase: realm, vm: viewModel)
        navigationController?.pushViewController(detailCurrencyVC, animated: true)
    }
    
    @objc func portfolioButtonTapped() {
        let portfolioVC = PortfolioVC()
        portfolioVC.configure(withDatabase: realm)
        navigationController?.pushViewController(portfolioVC, animated: true)
    }
}
