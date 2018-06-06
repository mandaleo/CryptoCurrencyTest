//
//  DataLayerUnitTest.swift
//  CryptoCurrencyUnitTests
//
//  Created by Manuel Martinez Gomez on 6/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import XCTest
@testable import CryptoCurrencyTest

class DataLayerUnitTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCoin() {
        let ethJson = fakeCoinJson()
        let ethCoin = Coin(json: ethJson)
        XCTAssert(ethCoin.id != 0, "Field required")
        XCTAssert(ethCoin.name != "" , "Field required")
        XCTAssert(ethCoin.symbol != "", "Field required")
        XCTAssert(ethCoin.rank != 0, "Field required")
    }
    
    //MARK: - Utils
    func fakeCoinJson() ->  Dictionary<String, Any> {
        var json = Dictionary<String, Any>()
        json["id"] = 2
        json["name"] = "Ethereum"
        json["symbol"] = "ETH"
        json["rank"] = 2
        json["price_usd"] = "719.98600000"
        json["price_btc"] = "0.07797240"
        json["24h_volume_usd"] = 3014730000
        json["market_cap_usd"] = 71421998446
        json["available_supply"] = 99199149
        json["total_supply"] = 99199149
        json["percent_change_1h"] = "0.28000000"
        json["percent_change_24h"] = "5.52000000"
        json["percent_change_7d"] = "14.58000000"
        json["created_at"] = "2018-05-03T08:54:02+00:00"
        json["updated_at"] = "2018-05-03T08:54:02+00:00"
        
        return json
    }
}
