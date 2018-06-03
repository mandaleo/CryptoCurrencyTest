//
//  ListCoinsWorker.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import Alamofire

class ListCoinsWorker {
    
    init(withPage page: Int, completion:@escaping ([Coin])-> ()) {
        let params: Parameters   = ["page": page];
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        APIClient().makeRequest(method: .get, endPoint: "/coins", params: params, headers: headers){ (maybeJson: Dictionary<String, Any>?) in
            var coins = [Coin]()
            if let json = maybeJson, let coinsData = json["coins"] as? Dictionary<String, Any>, let data = coinsData["data"] as? [Dictionary<String, Any>] {
                let jsonDecoder = JSONDecoder()
                for currency in data {
                    if let currencyData = try? JSONSerialization.data(withJSONObject: currency) {
                        let coin = try! jsonDecoder.decode(Coin.self, from: currencyData)
                        coins.append(coin)
                    }
                }
            }
            completion(coins)
        }
    }
}
