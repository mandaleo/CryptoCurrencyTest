//
//  PortfolioListWorker.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 4/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

// Worker to retrieve a list of portoflio items and save into Realm
class PortfolioListWorker {
    
    init(withDatabase realm: Realm, success:@escaping () -> (), failure:@escaping (Error)-> ()){
        let credentialData = "richard@rich.com:secret".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString()
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "Basic \(base64Credentials)"
        ]
        APIClient().makeRequest(method: .get, endPoint: "/portfolio", params: nil, headers: headers, success: { (maybeJson: Dictionary<String, Any>?) in
            if let json = maybeJson, let tradeDictArray = json["coins"] as? [Dictionary<String, Any>]{
                for tradeDict in tradeDictArray {
                    let trade = Trade(json: tradeDict, database: realm)
                    if !Trade.existTrade(realm: realm, otherTrade: trade) {
                        try! realm.write {
                            realm.add(trade)
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
