//
//  CurrencyDetailView.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class CurrencyDetailView: UIView, UITextFieldDelegate {
    
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
    @IBOutlet weak var tradeContainerView: UIControl!
    @IBOutlet weak var priceCalculatedLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var tradeOpaqueView: UIControl!
    @IBOutlet weak var nameCurrencyLabel: UILabel!
    
    //MARK: - Variables
    fileprivate var viewModel: CurrencyViewModel?
    
    //MARK: - Initialization and configuration
    override func awakeFromNib() {
        super.awakeFromNib()
        amountTextField.delegate = self
        notesTextViewAppearence()
    }
    
    func notesTextViewAppearence(){
        notesTextView.layer.cornerRadius = 8
        notesTextView.layer.borderWidth = 2
        notesTextView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func presentViewModel(vm: CurrencyViewModel) {
        viewModel = vm
        nameCurrencyLabel.text = vm.name
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
    
    //MARK: - Actions
    @IBAction func tradeContainerViewTapped(_ sender: Any) {
        toggleTradeContainerView(show: false)
    }
    
    @IBAction func tradeOpaqueViewTapped(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        toggleTradeContainerView(show: false)
    }
    
    @IBAction func makeTradeButtonTapped(_ sender: Any) {
        
    }
    @IBAction func amountTextFieldValueChanged(_ sender: Any) {
        guard let amountString = amountTextField.text, let amount = Double(amountString) else {
            priceCalculatedLabel.text = "0"
            return
        }
        let totalPrice = amount * (viewModel?.priceUSD ?? 0)
        priceCalculatedLabel.text = "\(totalPrice)"
    }
    
    //MARK: - Utils
    func toggleTradeContainerView(show: Bool){
        dismissKeyboard()
        UIView.animate(withDuration: 0.5) {
            self.tradeContainerView.isHidden = !show
        }
    }
    
    func dismissKeyboard() {
        endEditing(true)
    }
    
}
