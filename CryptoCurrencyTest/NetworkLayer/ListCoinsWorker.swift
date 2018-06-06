//
//  ListCoinsWorker.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

// Worker to retrieve a list of Coins and save into Realm
class ListCoinsWorker {
    
    init(withDatabase realm: Realm, page: Int, success:@escaping () -> (), failure:@escaping (Error)-> ()){
        let params: Parameters   = ["page": page];
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        APIClient().makeRequest(method: .get, endPoint: "/coins", params: params, headers: headers, success: { (maybeJson: Dictionary<String, Any>?) in
                if let json = maybeJson, let coinsData = json["coins"] as? Dictionary<String, Any>{
                    if let lastPage = coinsData["last_page"] as? Int {
                        UserDefaults.standard.saveFinalPage(finalPage: lastPage)
                    }
                    if let data = coinsData["data"] as? [Dictionary<String, Any>] {
                        for currency in data {
                            let coin = Coin(json: currency)
                            if !(Coin.fetchCoins(realm: realm, id: coin.id) != nil) {
                                try! realm.write {
                                    realm.add(coin)
                                }
                            }
                        }
                    }
                }
                success()
            },
            failure: { (err: Error) in
                failure(err)
            }
        )
    }
}
