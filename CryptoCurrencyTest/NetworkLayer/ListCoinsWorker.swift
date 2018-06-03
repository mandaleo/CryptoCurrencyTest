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
    
    init(withPage page: Int, completion:@escaping ()-> ()) {
        let params: Parameters   = ["page": page];
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        APIClient().makeRequest(method: .get, endPoint: "/coins", params: params, headers: headers){ (maybeJson: Dictionary<String, Any>?) in
            if let json = maybeJson, let coins = json["coins"] as? Dictionary<String, Any>, let data = coins["data"] as? [Dictionary<String, Any>] {
                let jsonDecoder = JSONDecoder()
                for currency in data {
                    if let currencyData = try? JSONSerialization.data(withJSONObject: currency) {
                        let coin = try! jsonDecoder.decode(Coin.self, from: currencyData)
                        print(coin)
                    }
                }
            }
            completion()
        }
    }
}
