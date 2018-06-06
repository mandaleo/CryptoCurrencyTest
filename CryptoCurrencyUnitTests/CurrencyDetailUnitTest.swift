//
//  CurrencyDetailUnitTest.swift
//  CryptoCurrencyUnitTests
//
//  Created by Manuel Martinez Gomez on 6/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import XCTest
import RealmSwift

@testable import CryptoCurrencyTest

class CurrencyDetailUnitTest: XCTestCase {
    
    var realm: Realm!
    var currencyDetailVC: CurrencyDetailVC!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm()

        currencyDetailVC = CurrencyDetailVC()
        currencyDetailVC.configure(withDatabase: realm, vm: fakeCurrencyVM())
        _ = currencyDetailVC.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialization() {
        _ = currencyDetailVC.view
        XCTAssert((currencyDetailVC.interactor != nil), "Error not be nil")
        XCTAssert((currencyDetailVC.presenter != nil), "Error not be nil")
        XCTAssert((currencyDetailVC.currencyDetailView != nil), "Error not be nil")
    }
    
}
