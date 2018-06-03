//
//  CurrencyListView.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

@objc protocol CurrencyListViewProtocol {
    @objc optional func loadMoreData()
}


class CurrencyListView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    fileprivate var viewModel: CurrencyListViewModel?
    var delegate: CurrencyListViewProtocol?
    
     //MARK: - Initialization and configuration
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CurrencyListCell.nib, forCellReuseIdentifier: CurrencyListCell.cellIdentifier)
    }
    
    func presentViewModel(vm: CurrencyListViewModel) {
        viewModel = vm
        tableView.reloadData()
    }
    
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
}
