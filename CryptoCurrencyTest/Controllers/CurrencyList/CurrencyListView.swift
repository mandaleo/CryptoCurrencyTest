//
//  CurrencyListView.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

protocol CurrencyListDelegate {
    func didSelectRow(viewModel:CurrencyViewModel)
}

class CurrencyListView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    fileprivate var viewModel: CurrencyListViewModel?
    var isLoading = false
    var delegate: CurrencyListDelegate?
    
     //MARK: - Initialization and configuration
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CurrencyListCell.nib, forCellReuseIdentifier: CurrencyListCell.cellIdentifier)
        tableView.tableFooterView = footerView()
    }
    
    func presentViewModel(vm: CurrencyListViewModel) {
        isLoading = false
        viewModel = vm
        if UserDefaults.standard.getCurrentPage() == UserDefaults.standard.getFinalPage() {
            isLoading = true
            tableView.tableFooterView = UIView()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vm = viewModel?.currencyList[indexPath.row] else {return}
        delegate?.didSelectRow(viewModel: vm)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let itemsCount = viewModel?.currencyList.count else {return}
        if !isLoading && indexPath.row == itemsCount - 1 {
            isLoading = true
            let nc = NotificationCenter.default
            nc.post(name: Notification.Name("loadMoreData"), object: nil)
        }
    }
    
    
    func footerView() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        footerView.backgroundColor = UIColor.white
        let spinner = UIActivityIndicatorView(frame: CGRect(x: (footerView.frame.size.width - 15) / 2, y: (footerView.frame.size.height - 25) / 2, width: 30, height: 30))
        spinner.activityIndicatorViewStyle = .whiteLarge
        spinner.color = UIColor.blue
        spinner.startAnimating()
        footerView.addSubview(spinner)
        return footerView
    }
}
