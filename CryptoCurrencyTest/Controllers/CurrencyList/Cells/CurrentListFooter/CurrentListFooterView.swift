//
//  CurrentListFooterView.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit

class CurrentListFooterView: UITableViewHeaderFooterView {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    static var viewHeight: CGFloat {
        get {return 48}
    }
    
    static var nib: UINib {
        get {return UINib(nibName: String(describing: self), bundle: nil)}
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        spinner.startAnimating()
    }

}
