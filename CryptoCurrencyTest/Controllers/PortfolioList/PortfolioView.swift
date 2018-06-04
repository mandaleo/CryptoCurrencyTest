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

class PortfolioView: UIView {
    
    //MARK: - Outlets

    //MARK: - Variables
    fileprivate var viewModel: TradesListViewModel?
    var delegate: PortfolioViewDelegate?
    
    //MARK: - Initialization and configuration
    override func awakeFromNib() {
        super.awakeFromNib()
        //setupTableView()
    }
    
    /*func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CurrencyListCell.nib, forCellReuseIdentifier: CurrencyListCell.cellIdentifier)
        tableView.tableFooterView = footerView()
    }*/
    
    func presentViewModel(vm: TradesListViewModel) {
        viewModel = vm
        //tableView.reloadData()
    }
   /*
    //MARK : - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.currencyList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = viewModel?.currencyList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyListCell.cellIdentifier, for: indexPath) as? CurrencyListCell
        
        cell?.presentViewModel(viewModel: item!)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vm = viewModel?.currencyList[indexPath.row] else {return}
        delegate?.didSelectRow(viewModel: vm)
    }*/
}
