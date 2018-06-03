//
//  Coin.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation

struct Coin: Codable {
    var id: Int
    var name : String
    var symbol: String
    //var logo: Any
    var rank: Int
    var price_usd: String
    var price_btc: String
    var volume_usd: Int
    var market_cap_usd: Int
    var available_supply: Int
    var total_supply: Int
    var percent_change_1h: String
    var percent_change_24h: String
    var percent_change_7d: String
    var created_at: String
    var updated_at: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        //var logo: Any //TODO: Know type?
        case rank
        case price_usd
        case price_btc
        case volume_usd = "24h_volume_usd"
        case market_cap_usd
        case available_supply
        case total_supply
        case percent_change_1h
        case percent_change_24h
        case percent_change_7d
        case created_at
        case updated_at
    }
}
