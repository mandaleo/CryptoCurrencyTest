//
//  CurrencyListView.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class CurrencyListView: UIView {
    
    //MARK: - Variables
    fileprivate var viewModel: CurrencyListViewModel?
    
     //MARK: - Initialization and configuration
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.blue
    }
    
    func presentViewModel(vm: CurrencyListViewModel) {
        if (viewModel != nil) && !vm.isEquals(other: viewModel!) {
            viewModel = vm
            //reloadTableData
        }else {
            viewModel = vm
        }
    }
}
