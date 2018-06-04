//
//  PortfolioVC.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 4/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit
import RealmSwift

class PortfolioVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var portfolioListview: PortfolioView!
    

    //MARK: - Variables
    var realm: Realm!
    var presenter:  PortfolioPresenter?
    var interactor: PortfolioInteractor?
    
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
        interactor = PortfolioInteractor(withDatabase: realm)
        presenter = PortfolioPresenter(container: portfolioListview, interactor: interactor)
        presenter?.interactorDidChange()
    }
    
    func setupTopBar(){
        self.title = "Portfolio"
    }
}
