//
//  CurrencyListCell.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class CurrencyListCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var currentPriceLabel: UILabel!
    @IBOutlet fileprivate weak var percentLastHourLabel: UILabel!
    @IBOutlet fileprivate weak var percentLastDayLabel: UILabel!
    @IBOutlet fileprivate weak var percentLastWeekLabel: UILabel!
    
    //MARK: - Variables
    static var cellIdentifier: String {
        get {return (String(describing: self))}
    }
    
    static var nib: UINib {
        get {return UINib(nibName: String(describing: self), bundle: nil)}
    }
    
    //MARK: - Initialization and configuration
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func presentViewModel(viewModel: CurrencyViewModel) {
        nameLabel.text = "Name: " + viewModel.name
        currentPriceLabel.text = "Price: \(viewModel.priceUSD)"
        percentLastHourLabel.text = "Percentage change last hour: \(viewModel.percentageLastHour)"
        percentLastDayLabel.text = "Percentage change last day: \(viewModel.percentageLastDay)"
        percentLastWeekLabel.text = "Percentage change last week: \(viewModel.percentageLastWeek)"
    }
}
