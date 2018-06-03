//
//  CurrencyDetailView.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class CurrencyDetailView: UIView {

    //MARK: - Variables
    fileprivate var viewModel: CurrencyViewModel?
    
    //MARK: - Initialization and configuration
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func presentViewModel(vm: CurrencyViewModel) {
        viewModel = vm
    }
}
