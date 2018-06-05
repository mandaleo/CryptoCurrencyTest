//
//  CryptoCurrencyTestUITests.swift
//  CryptoCurrencyTestUITests
//
//  Created by Manuel Martinez Gomez on 5/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import XCTest

class CryptoCurrencyTestUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCurrencyListNavBar() {
        let currencyListNavigationBar = app.navigationBars["Currency List"]
        let title = currencyListNavigationBar.otherElements["Currency List"]
        XCTAssert(title.exists, "NavigationBar title is empty")
        
        let portfolioButton = currencyListNavigationBar.buttons["Portfolio"]
        XCTAssert(portfolioButton.exists, "Portfolio button does not exist")
        XCTAssert(portfolioButton.isEnabled, "Portfolio button does not enable")
    }
    
    func testNavigateToPortfolio() {
        let currencyListNavigationBar = app.navigationBars["Currency List"]
        currencyListNavigationBar.tap()
        XCUIApplication().navigationBars["Currency List"].buttons["Portfolio"].tap()
    
        let portfolioNavigationBar = app.navigationBars["Portfolio"]
        XCTAssert(portfolioNavigationBar.exists, "Portfolio navigation does not exist")
        let title = portfolioNavigationBar.otherElements["Portfolio"]
        XCTAssert(title.exists, "NavigationBar title is empty")
    }
    
    func testNavigateToLitecoinDetail() {
        goDetailLitecoin()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let name = elementsQuery.staticTexts["Litecoin"]
        XCTAssert(name.exists, "Litecoin name does not exist")
    }
    
    func testTradeView() {
        goDetailLitecoin()
        let tradeView = app.staticTexts.matching(identifier: "tradeContainerView").firstMatch
        XCTAssert(!tradeView.exists, "Trade view must be invisible")
        let showTradeViewButton = app.navigationBars["Litecoin"].buttons["Add Trade"]
        showTradeViewButton.tap()
        XCTAssert(tradeView.exists, "Trade view must be visible")
    }
    
    func goDetailLitecoin(){
        app.swipeUp()
        let element = app.tables.staticTexts["Name: Litecoin"]
        element.tap()
    }
}
