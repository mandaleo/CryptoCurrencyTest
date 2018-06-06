//
//  CurrencyListUnitTest.swift
//  CryptoCurrencyUnitTests
//
//  Created by Manuel Martinez Gomez on 6/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import XCTest
import RealmSwift

@testable import CryptoCurrencyTest


class CurrencyListUnitTest: XCTestCase {
    
    var realm: Realm!
    var currencyListVC: CurrencyListVC!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm()
        
        //Initializate CurrentListVC
        currencyListVC = CurrencyListVC()
        currencyListVC.configure(withDatabase: realm)
        _ = currencyListVC.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
    }
    
}
