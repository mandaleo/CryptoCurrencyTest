//
//  PortfolioView.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 4/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

protocol PortfolioViewDelegate {
    //func didSelectRow(viewModel:CurrencyViewModel)
}

class PortfolioView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var totalUSDLabel: UILabel!
    
    //MARK: - Variables
    fileprivate var viewModel: TradesListViewModel?
    var delegate: PortfolioViewDelegate?
    
    //MARK: - Initialization and configuration
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(PortfolioListCell.nib, forCellReuseIdentifier: PortfolioListCell.cellIdentifier)
        tableview.tableFooterView = UIView()
    }
    
    func presentViewModel(vm: TradesListViewModel) {
        viewModel = vm
        totalUSDLabel.text = "\(vm.totalPriceUSD)"
        tableview.reloadData()
    }
    //MARK : - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.tradesList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = viewModel?.tradesList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PortfolioListCell.cellIdentifier, for: indexPath) as? PortfolioListCell
        
        cell?.presentViewModel(viewModel: item!)
        
        return cell!
    }
}
