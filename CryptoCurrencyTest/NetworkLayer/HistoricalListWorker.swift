//
//  CurrencyValuesListWorker.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 5/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class HistoricalListWorker {
    
    init(withDatabase realm: Realm, coinId: Int, success:@escaping () -> (), failure:@escaping (Error)-> ()){
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        APIClient().makeRequest(method: .get, endPoint: "/coins/\(coinId)/historical", params: nil, headers: headers, success: { (maybeJson: Dictionary<String, Any>?) in
            if let json = maybeJson, let historicalArray = json["historical"] as? [Dictionary<String, Any>]{
                for historical in historicalArray {
                    let currencyValue = CurrencyValue(json: historical, database: realm, coinId: coinId)
                    if !CurrencyValue.existCurrencyValue(realm: realm, otherCurrencyValue: currencyValue) {
                        try! realm.write {
                            realm.add(currencyValue)
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
