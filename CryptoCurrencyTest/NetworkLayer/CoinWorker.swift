//
//  CoinWorker.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 4/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class CoinWorker {
    
    init(withDatabase realm: Realm, coinId: Int, success:(() -> ())?, failure:((Error)-> ())?){
        let params: Parameters   = ["coin_id": coinId];
        let headers: HTTPHeaders = [
            "Accept": "application/json",
        ]
        APIClient().makeRequest(method: .get, endPoint: "/coins/\(coinId)", params: params, headers: headers, success: { (maybeJson: Dictionary<String, Any>?) in
            if let json = maybeJson, let tradeDict = json["coin"] as? Dictionary<String, Any>{
                let coin = Coin(json: tradeDict)
                if !(Coin.fetchCoins(realm: realm, id: coin.id) != nil) {
                    try! realm.write {
                        realm.add(coin)
                    }
                }
            }
            if let success = success {
                success()
            }
        },
                                failure: { (err: Error) in
                                    if let failure = failure {
                                        failure(err)
                                    }
        }
        )
    }
}

