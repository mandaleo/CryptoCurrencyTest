//
//  CurrencyDetailView.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class CurrencyDetailView: UIView {
    
    //MARK: - Outlets
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var symbolLabel: UILabel!
    @IBOutlet fileprivate weak var rankLabel: UILabel!
    @IBOutlet fileprivate weak var usdPriceLabel: UILabel!
    @IBOutlet fileprivate weak var btcPriceLabel: UILabel!
    @IBOutlet fileprivate weak var usdVolumeLastDayLabel: UILabel!
    @IBOutlet fileprivate weak var usdCapMarketLabel: UILabel!
    @IBOutlet fileprivate weak var availableSupplyLabel: UILabel!
    @IBOutlet fileprivate weak var totalSupplyLabel: UILabel!
    @IBOutlet fileprivate weak var percentageChangeLastHourLabel: UILabel!
    @IBOutlet fileprivate weak var percentageChangeLastDayLabel: UILabel!
    @IBOutlet fileprivate weak var percentageChangeLastWeekLabel: UILabel!
    

    //MARK: - Variables
    fileprivate var viewModel: CurrencyViewModel?
    
    //MARK: - Initialization and configuration
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func presentViewModel(vm: CurrencyViewModel) {
        viewModel = vm
        nameLabel.text = vm.name
        symbolLabel.text = vm.symbol
        rankLabel.text = "\(vm.rank)"
        usdPriceLabel.text = "\(vm.priceUSD)"
        btcPriceLabel.text = "\(vm.priceBTC)"
        usdVolumeLastDayLabel.text = "\(vm.volumeUSD)"
        usdCapMarketLabel.text = "\(vm.marketCapUSD)"
        availableSupplyLabel.text = "\(vm.availableSupply)"
        totalSupplyLabel.text = "\(vm.totalSupply)"
        percentageChangeLastHourLabel.text = "\(vm.percentageLastHour)"
        percentageChangeLastDayLabel.text = "\(vm.percentageLastDay)"
        percentageChangeLastWeekLabel.text = "\(vm.percentageLastWeek)"
    }
}
