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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var percentLastHourLabel: UILabel!
    @IBOutlet weak var percentLastDayLabel: UILabel!
    @IBOutlet weak var percentLastWeekLabel: UILabel!
    
    //Variables
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
        nameLabel.text = viewModel.name
        currentPriceLabel.text = "\(viewModel.priceUSD)"
        percentLastHourLabel.text = "\(viewModel.percentageLastHour)"
        percentLastDayLabel.text = "\(viewModel.percentageLastDay)"
        percentLastWeekLabel.text = "\(viewModel.percentageLastWeek)"
    }
}
