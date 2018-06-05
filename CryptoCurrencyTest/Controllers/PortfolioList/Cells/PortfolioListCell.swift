//
//  PortfolioListCell.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 5/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class PortfolioListCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var amountLabel: UILabel!
    @IBOutlet fileprivate weak var priceLabel: UILabel!
    
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
    
    func presentViewModel(viewModel: TradeViewModel) {
        nameLabel.text = viewModel.coinName
        amountLabel.text = "\(viewModel.amount)"
        priceLabel.text = "\(viewModel.priceUSD)"
    }
    
}
